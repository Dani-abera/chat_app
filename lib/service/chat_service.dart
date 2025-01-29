import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // get instances firestore $ auth

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = AuthService();

  // get user stream

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshots) {
      return snapshots.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiverID, message) async {
    // get current user Info

    final String currentUserID = _auth.getCurrentUser()!.uid;
    final String currentUserEmail = _auth.getCurrentUser()!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create a new message

    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiverID: receiverID,
        message: message,
        timestamp: timestamp);

    //  chat room ID

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomId = ids.join('_');

    // add new message to the database
    await _firestore
        .collection("Chat_Rooms")
        .doc(chatRoomId)
        .collection("message")
        .add(newMessage.toMap());
  }

  // get message

  Stream<QuerySnapshot> getMessages(String userID, receiverID) {
    List<String> ids = [userID, receiverID];
    ids.sort();
    String chatRoomId = ids.join('_');

    return _firestore
        .collection("Chat_Rooms")
        .doc(chatRoomId)
        .collection("message")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
