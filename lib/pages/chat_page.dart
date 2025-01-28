import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiversEmail;
  const ChatPage({super.key, required this.receiversEmail});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Page'),
      ),
    );
  }
}
