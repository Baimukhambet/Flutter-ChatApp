import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key, required this.logoutTapped});

  void Function()? logoutTapped;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerHeader(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.message,
                        size: 60, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        const Icon(Icons.person_2_rounded),
                        const SizedBox(width: 25),
                        Text(_authService.getCurrentUser()!.email!),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(width: 25),
                        Text('H O M E'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 25),
                        Text('S E T T I N G S'),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: GestureDetector(
                    onTap: logoutTapped,
                    child: const Row(
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 25),
                        Text('L O G O U T'),
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
