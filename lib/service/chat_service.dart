import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
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

  // report user

  Future<void> reportUser(String messageId, String userID) async {
    final currentUser = _auth.getCurrentUser();
    final report = {
      'reportedBy': currentUser!.uid,
      'messageID': messageId,
      'messageUserId': userID,
      'timestamp': FieldValue.serverTimestamp(),
    };
    await _firestore.collection('report').add(report);
  }

  // Block user

  Future<void> blockUser(String userId) async {
    final currentUser = _auth.getCurrentUser();
    await _firestore
        .collection('Users')
        .doc(currentUser!.uid)
        .collection('BlockUser')
        .doc(userId)
        .set({});
    notifyListeners();
  }

  // unBlock user
  Future<void> unBlockUser(String userId) async {
    final currentUser = _auth.getCurrentUser();
    await _firestore
        .collection('Users')
        .doc(currentUser!.uid)
        .collection('BlockUser')
        .doc(userId)
        .delete();
  }

  // get blocked user

  Stream<List<Map<String, dynamic>>> getBlockedUser(String userId) {
    return _firestore
        .collection('Users')
        .doc(userId)
        .collection('BlockUser')
        .snapshots()
        .asyncMap((snapshots) async {
      final blockedUserId = snapshots.docs.map((doc) => doc.id).toList();
      final userDocs = await Future.wait(
        blockedUserId.map(
          (id) => _firestore.collection('Users').doc(id).get(),
        ),
      );
      return userDocs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    });
  }

  // get blocked user
  Stream<List<Map<String, dynamic>>> getUnblockedUsers() {
    final currentUser = _auth.getCurrentUser();

    return _firestore
        .collection("Users")
        .doc(currentUser!.uid)
        .collection('BlockUser')
        .snapshots()
        .asyncMap((snapshot) async {
      final blockedUserId = snapshot.docs.map((docs) => docs.id).toList();
      final userSnapshot = await _firestore.collection('Users').get();

      return userSnapshot.docs
          .where((doc) =>
              doc.data()['email'] != currentUser.email &&
              !blockedUserId.contains(doc.id))
          .map((doc) => doc.data())
          .toList();
    });
  }
}
