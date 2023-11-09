import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/services/firebase_auth_service.dart';
import 'package:mylibrary/services/firestore_service.dart';

final authenticationProvider =
    ChangeNotifierProvider<FirebaseAuthService>((ref) => FirebaseAuthService());

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authenticationProvider).authStateChangegs;
});

final fireStoreServiceProvider =
    ChangeNotifierProvider<FireStoreService>((ref) => FireStoreService());
final showPageChangeProvider =
    ChangeNotifierProvider<showPage>((ref) => showPage());

class showPage extends ChangeNotifier {
  bool showPageChange = true;

  showPageChangeFunction() {
    showPageChange != showPageChange;
    notifyListeners();
  }
}
