import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/pages/control_page/control_page.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/providers/auth_page_change.dart';

class AfterSplashScreen extends ConsumerWidget {
  const AfterSplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    var currentUser = _firebaseAuth.currentUser;
    return authState.when(
      data: (data) {
        if (data != null && currentUser!.emailVerified) {
          return const ControlPage();
        } else {
          return const AuthPageChange();
        }
      },
      error: (error, stackTrace) => ErrorWidget(error),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
