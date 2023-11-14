import 'package:flutter/material.dart';
import 'package:mylibrary/companants/colors.dart';

class ThemeModeClass {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.black),
    ),
    colorScheme: ColorScheme.light(
        background: backgroundColor,
        primary: Colors.white,
        secondary: Colors.grey.shade200,
        tertiary: Colors.black),
  );
  static ThemeData darkMode = ThemeData(
    appBarTheme:
        const AppBarTheme(titleTextStyle: TextStyle(color: Colors.white)),
    brightness: Brightness.dark,
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: ColorScheme.dark(
        background: Colors.black,
        primary: Colors.grey.shade900,
        secondary: Colors.grey.shade700,
        tertiary: Colors.white),
  );
}
