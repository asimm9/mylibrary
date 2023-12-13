// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/providers/all_providers.dart';

// ignore: must_be_immutable
class SearchField extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();
  double height;
  SearchField({
    super.key,
    required this.height,
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
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'içerik ismini arayınız',
            suffixIcon: Icon(Icons.tune),
            border: InputBorder.none),
        onSubmitted: (value) {
          ref.watch(fireStoreServiceProvider).searchFavoriteCardList(value);
        },
      ),
    );
  }
}
