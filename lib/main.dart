import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/themes/chat_app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ChatAppThemes.lightTheme, // Light theme
      darkTheme: ChatAppThemes.darkTheme, // Dark theme
      home: LoginPage(),
    );
  }
}
