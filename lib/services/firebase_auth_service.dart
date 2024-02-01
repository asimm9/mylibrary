import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

class FirebaseAuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final Uuid _uuid = const Uuid();

  Stream<User?> get authStateChangegs => _auth.authStateChanges();

  Future<User?> signIn(String email, String password) async {
    UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? lastUser = user.user;
    return lastUser;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<User?> register(
      String email, String password, String? username) async {
    UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? lastUser = user.user;

    Map<String, dynamic> dataMap = {
      'email': email,
      'id': user.user!.uid,
      'username': username
    };
    await _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .set(dataMap);

    return lastUser;
  }

  forgotPassword(String email) {
    _auth.sendPasswordResetEmail(email: email).then((value) {
      _auth.signOut();
    });
  }

  Future<User> authWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    Map<String, dynamic> dataMap = {
      'email': userCredential.user!.email,
      'id': userCredential.user!.uid,
      'username': _uuid.v4()
    };
    await _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .set(dataMap);
    print(userCredential.user!.toString());
    return userCredential.user!;
  }
}
