import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  RegisterPage({super.key, this.onTap});

  void register(BuildContext context) async {
    if (_pwController.text != _pwController.text) {
      showErrorDialog(context, 'Passwords do not match!');
      return;
    }
    if (_pwController.text.length < 6) {
      showErrorDialog(context, 'Short Password!');
      return;
    }

    try {
      await GetIt.I<AuthService>().registerUserWithEmailAndPassword(
          _emailController.text, _pwController.text);
      showErrorDialog(context, 'Success!');
    } catch (e) {
      showErrorDialog(context, e.toString());
    }
  }

  void showErrorDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(text),
      ),
    );
  }

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message,
                size: 60, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 50),
            Text("Let's create an account!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                )),
            const SizedBox(height: 25),
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: _pwController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: 'Confirm password',
              obscureText: true,
              controller: _confirmPwController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Register',
              onTap: () => register(context),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ",
                    style: TextStyle(color: colors.primary)),
                GestureDetector(
                  onTap: onTap,
                  child: Text('Login now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colors.primary,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
