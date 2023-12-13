import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/show_page_provider.dart';
import 'package:mylibrary/providers/theme_provider.dart';
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
    ChangeNotifierProvider<ShowPage>((ref) => ShowPage());

final themeModeProvider =
    ChangeNotifierProvider<ThemeProvider>((ref) => ThemeProvider());

final selectedItemtypeProvider = StateProvider<ItemType?>((ref) => null);
final currentSliderValueProvider = StateProvider<double>((ref) => 0);
final selectedIndexNavigatorBarProvider = StateProvider<int>((ref) => 0);

final itemTypeListProvider =
    StateProvider<List>((ref) => [false, false, false]);
