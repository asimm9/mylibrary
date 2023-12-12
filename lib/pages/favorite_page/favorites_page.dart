import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/pages/favorite_page/widgets/item_list_field.dart';
import 'package:mylibrary/pages/favorite_page/widgets/search_field.dart';
import 'package:mylibrary/providers/all_providers.dart';

class FavoritesPage extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();
  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Stream<QuerySnapshot<Map<String, dynamic>>> favoriteCardsStream =
        ref.watch(fireStoreServiceProvider.notifier).getFavoriteList();
    double height = MediaQuery.of(context).size.height;
    Stream<QuerySnapshot<Map<String, dynamic>>> searchCardsStream =
        ref.watch(fireStoreServiceProvider).favoriteCardStream;
    return Column(
      children: [
        SearchField(height: height),
        Padding(padding: EdgeInsets.all(height * 0.018)),
        ItemListField(
            height: height,
            favoriteCardsStream: favoriteCardsStream,
            searchCardsStream: searchCardsStream),
        Padding(padding: EdgeInsets.all(height * 0.008)),
        Text(LocaleKeys.favoritePage_swipeLeftToRemoveFromFavorites.locale)
      ],
    );
  }
}
