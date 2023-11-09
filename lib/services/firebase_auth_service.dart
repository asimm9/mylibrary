import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChangegs => _auth.authStateChanges();

  Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user!;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User> register(String email, String password, String? username) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user!;
  }
}
