import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/item_rate_list_provider.dart';
import 'package:mylibrary/providers/item_rate_value_list_provider.dart';
import 'package:mylibrary/providers/item_type_list_provider.dart';
import 'package:mylibrary/providers/item_type_value_list_provider.dart';
import 'package:mylibrary/providers/language_count_provider.dart';
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

final itemTypeValueListProvider =
    ChangeNotifierProvider<ItemTypeValue>((ref) => ItemTypeValue());

final itemRateValueListProvider =
    ChangeNotifierProvider<ItemRateValue>((ref) => ItemRateValue());

final itemTypeListProvider =
    ChangeNotifierProvider<ItemList>((ref) => ItemList());
final itemRateListProvider =
    ChangeNotifierProvider<ItemRataList>((ref) => ItemRataList());

final languageCountProvider =
    ChangeNotifierProvider<LanguageCount>((ref) => LanguageCount());

final selectedItemtypeProvider = StateProvider<ItemType?>((ref) => null);
final currentSliderValueProvider = StateProvider<double>((ref) => 1);
final selectedIndexNavigatorBarProvider = StateProvider<int>((ref) => 0);
