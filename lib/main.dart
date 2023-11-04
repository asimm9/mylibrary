import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/constans/colors.dart';
import 'package:mylibrary/pages/control_page.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      color: backgroundColor,
      home: const ControlPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
