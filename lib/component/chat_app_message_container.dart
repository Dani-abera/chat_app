import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatAppMessageContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isCurrentUser;
  const ChatAppMessageContainer(
      {super.key, required this.isCurrentUser, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.greenAccent[700] : Colors.yellow[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: isCurrentUser ? Radius.circular(30) : Radius.circular(0),
          bottomRight: isCurrentUser ? Radius.circular(0) : Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 25,
      ),
      padding: EdgeInsets.all(
        16,
      ),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            data['message'],
            style: TextStyle(
              color: isCurrentUser ? Colors.white : Colors.black87,
              fontSize: 16,
              height: 1.4,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 4),
          Text(
            DateFormat('HH:mm').format(
              // Choose the appropriate conversion method based on your data type:
              data['timestamp'] is int
                  ? DateTime.fromMillisecondsSinceEpoch(data['timestamp'])
                  : data['timestamp'] is Timestamp
                      ? data['timestamp'].toDate()
                      : data['timestamp'],
            ),
            style: TextStyle(
              color: isCurrentUser ? Colors.white70 : Colors.black54,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
