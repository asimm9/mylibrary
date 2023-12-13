import 'package:flutter/material.dart';
import 'package:mylibrary/theme/theme_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeModeClass.lightMode;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleThemeMode() {
    if (_themeData == ThemeModeClass.lightMode) {
      themeData = ThemeModeClass.darkMode;
    } else {
      themeData = ThemeModeClass.lightMode;
    }
  }
}
