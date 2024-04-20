import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void logoutTapped() {
    GetIt.I<AuthService>().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: logoutTapped,
            child: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
