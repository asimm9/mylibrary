// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/pages/home_page/widgets/search_filter.dart';
import 'package:mylibrary/providers/all_providers.dart';

// ignore: must_be_immutable
class SearchContainer extends ConsumerWidget {
  TextEditingController searchController;
  double height;
  Size size;
  SearchContainer({
    super.key,
    required this.searchController,
    required this.height,
    required this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
          color: Theme.of(context).colorScheme.primary),
      margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
      height: height * 0.061,
      child: TextField(
        textAlign: TextAlign.center,
        controller: searchController,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: LocaleKeys.homePage_searchContent.locale,
            suffixIcon: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => SearchFilter(
                          size: size,
                        ));
              },
              icon: const Icon(Icons.tune),
              splashColor: Colors.transparent,
            ),
            border: InputBorder.none),
        onSubmitted: (value) {
          ref.watch(fireStoreServiceProvider).searchCardList(value);
        },
      ),
    );
  }
}
