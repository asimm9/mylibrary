import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/constans/colors.dart';
import 'package:mylibrary/pages/control_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mylibrary/pages/login_page.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/services/firebase_auth_service.dart';
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

  // This widget is the root of your application.
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
            return const LoginPage();
          }
        },
        error: (error, stackTrace) => ErrorWidget(error),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ) /* const ControlPage(), */,
      debugShowCheckedModeBanner: false,
    );
  }
}
