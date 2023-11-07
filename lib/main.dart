import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/constans/colors.dart';
import 'package:mylibrary/pages/control_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mylibrary/pages/login_page.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      home: authState.when(
        data: (data) {
          if (data != null) {
            return const ControlPage();
          } else {
            return LoginPage();
          }
        },
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
