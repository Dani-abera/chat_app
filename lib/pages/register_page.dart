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
              onPressed: () {},
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
