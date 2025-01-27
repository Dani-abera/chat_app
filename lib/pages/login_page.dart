import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/component/chat_app_button.dart';
import 'package:chat_app/component/chat_app_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function() onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void logIn() {
    final authService = AuthService();
    try {
      authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
            ),
            Text(
              "Hey, Welcome Back! 👋",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 25,
            ),

            ChatAppTextField(
                hintText: 'Email',
                prefixIcon: Icons.email,
                controller: emailController),
            ChatAppTextField(
              hintText: 'Password',
              prefixIcon: Icons.password,
              controller: passwordController,
              isPassword: true,
            ),
            SizedBox(
              height: 25,
            ),
            ChatAppButton(
              text: 'LogIn',
              onPressed: () => logIn(),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member ! ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register Now',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
