import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/services/firebase_auth_service.dart';
import 'package:mylibrary/services/firestore_service.dart';
import 'package:mylibrary/theme/theme_mode.dart';

final authenticationProvider =
    ChangeNotifierProvider<FirebaseAuthService>((ref) => FirebaseAuthService());

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authenticationProvider).authStateChangegs;
});

final fireStoreServiceProvider =
    ChangeNotifierProvider<FireStoreService>((ref) => FireStoreService());

final showPageChangeProvider =
    ChangeNotifierProvider<ShowPage>((ref) => ShowPage());

final themeModeProvider =
    ChangeNotifierProvider<ThemeProvider>((ref) => ThemeProvider());

class ShowPage extends ChangeNotifier {
  bool showPageChange = true;
  showPageChangeFunction() {
    showPageChange = !showPageChange;
    notifyListeners();
  }
}

final selectedItemTypeProvider = Provider<ItemType?>((ref) => null);

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
