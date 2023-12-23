import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/pages/favorite_page/widgets/item_list_field.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/services/firestore_service.dart';
import 'package:mylibrary/widgets/search_widget/search_container.dart';

class FavoritesPage extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();
  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    List itemTypeList = ref.watch(itemTypeValueListProvider).typeListFavorite;
    List itemRateList =
        ref.watch(itemRateValueListProvider).itemRateListFavorite;
    FireStoreService fireStoreRef =
        ref.watch(fireStoreServiceProvider.notifier);
    return Column(
      children: [
        SearchContainer(
          height: size.height,
          size: size,
          searchController: searchController,
          onSearch: (value) =>
              ref.watch(fireStoreServiceProvider).searchFavoriteCardList(value),
          typeList: itemTypeList,
          itemRateList: itemRateList,
          onTap: () {
            List selectedTypeList = ref.watch(itemTypeListProvider).typeList;

            List selectedRateList =
                ref.watch(itemRateListProvider).itemRateList;

            List value = typeListController(itemTypeList, selectedTypeList);

            List rateValue = itemRateController(itemRateList, selectedRateList);

            fireStoreRef.itemRateFavoriteCardList(rateValue);
            fireStoreRef.filterFavoriteCardList(value);
            debugPrint(rateValue.toString());

            ref.watch(itemTypeListProvider).updateItemList();
            ref.watch(itemRateListProvider).updateItemList();

            Navigator.pop(context);
          },
        ),
        Padding(padding: EdgeInsets.all(size.height * 0.018)),
        ItemListFavoriteField(
          searchController: searchController,
          height: size.height,
        ),
        Padding(padding: EdgeInsets.all(size.height * 0.008)),
        Text(LocaleKeys.favoritePage_swipeLeftToRemoveFromFavorites.locale)
      ],
    );
  }
}

List typeListController(List typeList, List selectedList) {
  if (typeList[0]) {
    selectedList.add('film');
  }
  if (typeList[1]) {
    selectedList.add('series');
  }
  if (typeList[2]) {
    selectedList.add('book');
  }
  return selectedList;
}

List itemRateController(List itemRateList, List selectedList) {
  if (itemRateList[0]) {
    selectedList.add(1);
  }
  if (itemRateList[1]) {
    selectedList.add(2);
  }
  if (itemRateList[2]) {
    selectedList.add(3);
  }
  if (itemRateList[3]) {
    selectedList.add(4);
  }
  if (itemRateList[4]) {
    selectedList.add(5);
  }
  return selectedList;
}
