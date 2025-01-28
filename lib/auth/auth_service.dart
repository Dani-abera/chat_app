import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign in
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // _firestore.collection("Users").doc(userCredential.user!.uid).set({
      //   'uid': userCredential.user!.uid,
      //   'email': email,
      // });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Get Current User

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // sign up
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        await _firestore.collection("Users").doc(userCredential.user!.uid).set({
          'uid': userCredential.user!.uid,
          'email': email,
          'name': name.toLowerCase(),
        });
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('Error during sign-up: ${e.message}');
      }
      throw Exception('Error: ${e.message}');
    }
  }

  // sign out

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
