import 'package:chat_app/auth/auth_gete.dart';
import 'package:chat_app/pages/test.dart';
import 'package:chat_app/themes/chat_app_themes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: AuthGete(),
      //home: DropdownIconButton(),
    );
  }
}
