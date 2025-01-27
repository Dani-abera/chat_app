import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../component/chat_app_button.dart';
import '../component/chat_app_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function() onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  void signup() {
    final auth = AuthService();
    if (passwordController.text == conformPasswordController.text) {
      try {
        auth.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
              "Oops! Your password and confirm password don’t match. Please try again."),
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
              Icons.app_registration,
              size: 60,
            ),
            Text(
              "Join Us Today! 🎉",
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
            ChatAppTextField(
              hintText: 'Conform Password',
              prefixIcon: Icons.password_sharp,
              controller: conformPasswordController,
              isPassword: true,
            ),
            SizedBox(
              height: 25,
            ),
            ChatAppButton(
              text: 'Register',
              onPressed: () => signup(),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already a registered ! ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'LogIn Now',
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
