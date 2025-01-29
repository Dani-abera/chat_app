import 'package:chat_app/component/chat_app_message_container.dart';
import 'package:chat_app/component/chat_app_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../auth/auth_service.dart';
import '../service/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiversEmail;
  final String receiverID;
  const ChatPage({
    super.key,
    required this.receiversEmail,
    required this.receiverID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final chatService = ChatService();
  final authService = AuthService();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        Future.delayed(Duration(milliseconds: 500), () => scrollDown());
      }
    });
    Future.delayed(Duration(milliseconds: 500), () => scrollDown());
  }

  @override
  void dispose() {
    focusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await chatService.sendMessage(widget.receiverID, _messageController.text);
      _messageController.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat With ${widget.receiversEmail}'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: _buildMessageList(),
          ),
          _buildInput(),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: chatService.getMessages(senderID, widget.receiverID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading....');
          }
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageListItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageListItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == authService.getCurrentUser()!.uid;

    return ChatAppMessageContainer(
      isCurrentUser: isCurrentUser,
      data: data,
    );
  }

  Widget _buildInput() {
    return Row(
      children: [
        Expanded(
          child: ChatAppTextField(
            hintText: 'Type A Message',
            prefixIcon: Icons.add,
            controller: _messageController,
            focusNode: focusNode,
          ),
        ),
        IconButton(
            onPressed: () {
              sendMessage();
              _messageController.clear();
            },
            icon: Icon(Icons.send))
      ],
    );
  }
}
