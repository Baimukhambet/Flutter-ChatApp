import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logoutTapped() {
    GetIt.I<AuthService>().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      drawer: MyDrawer(
        logoutTapped: logoutTapped,
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserTile(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserTile(Map<String, dynamic> userData, BuildContext context) {
    return (userData['email'] != _authService.getCurrentUser()!.email)
        ? UserTile(
            onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatPage(
                      receiverEmail: userData['email'],
                      receiverID: userData['uid'],
                    ),
                  ))
                },
            email: userData['email'])
        : Container();
  }
}
