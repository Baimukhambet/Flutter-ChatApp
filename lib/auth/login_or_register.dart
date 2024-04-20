import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  LoginOrRegisterState createState() => LoginOrRegisterState();
}

class LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (showLoginPage)
        ? LoginPage(
            onTap: togglePages,
          )
        : RegisterPage(
            onTap: togglePages,
          );
  }
}
