import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/component/chat_app_button.dart';
import 'package:chat_app/component/chat_app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      // Show a loading indicator while logging in
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);

      // Dismiss the loading indicator
      Navigator.of(context).pop();
    } catch (e) {
      // Dismiss the loading indicator in case of an error
      Navigator.of(context).pop();

      // Cast error to Exception or handle as Object
      final errorMessage = e is Exception
          ? _getErrorMessage(e)
          : 'An unexpected error occurred. Please try again later.';

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text(errorMessage),
        ),
      );
    }
  }

  String _getErrorMessage(Exception e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return 'No user found for that email.';
        case 'wrong-password':
          return 'Incorrect password provided.';
        case 'invalid-email':
          return 'The email address is not valid.';
        default:
          return 'An error occurred. Please try again.';
      }
    }
    return 'An unexpected error occurred. Please try again later.';
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
