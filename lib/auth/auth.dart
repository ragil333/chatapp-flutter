import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<UserCredential?> registration({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _fireBaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _fireStore.collection("users").doc(credential.user!.uid).set(
        {
          "uid": credential.user!.uid,
          "email": credential.user!.email,
          "name": name,
        },
        SetOptions(merge: true),
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserCredential?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential user = await _fireBaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<String?> logout() async {
    try {
      await _fireBaseAuth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }
}
