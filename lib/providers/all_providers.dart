import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/services/firebase_auth_service.dart';

final authenticationProvider =
    ChangeNotifierProvider<FirebaseAuthService>((ref) => FirebaseAuthService());

final authStateChangesProvider = StreamProvider((ref) {
  return ref.watch(authenticationProvider).authStateChangegs;
});
