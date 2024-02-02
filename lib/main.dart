import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/app_constans.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mylibrary/pages/splash_screen_page/splash_screen_page.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
          supportedLocales: AppConstant.SUPPORTED_LANG,
          path: AppConstant.LANG_PATH,
          child: const MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themeModeProvider);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: ThemeMode.system,
      theme: themeModeState.themeData,
      home: const SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
