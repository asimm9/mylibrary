// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/pages/home_page/widgets/item_list_container.dart';
import 'package:mylibrary/pages/home_page/widgets/search_container.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      SearchContainer(
        searchController: searchController,
        height: size.height,
        size: size,
      ),
      Padding(padding: EdgeInsets.all(size.height * 0.018)),
      ItemListContainer(searchController: searchController, height: size.height)
    ]);
  }
}
