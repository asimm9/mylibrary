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

  // Future _searchFilter(
  //     Size size, BuildContext context, WidgetRef ref, List typeList) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         margin: EdgeInsets.only(
  //           bottom: size.height * 0.35,
  //         ),
  //         child: AlertDialog(
  //           content: IntrinsicHeight(
  //             child: StatefulBuilder(
  //               builder: (context, setState) => Column(
  //                 children: [
  //                   Expanded(
  //                     child: Row(
  //                       children: [
  //                         Expanded(
  //                           child: Column(
  //                             children: [
  //                               Text(
  //                                 LocaleKeys.homePage_filter_type.locale,
  //                                 style: filterTextStyle,
  //                               ),
  //                               SizedBox(height: size.height * 0.02),
  //                               CheckboxListTile(
  //                                 checkColor: Colors.grey.shade600,
  //                                 contentPadding: EdgeInsets.zero,
  //                                 value: typeList[0],
  //                                 onChanged: (value) {
  //                                   setState(() => typeList[0] = value!);
  //                                 },
  //                                 title: Text(
  //                                   LocaleKeys.homePage_filter_filmName.locale,
  //                                   style: const TextStyle(fontSize: 15),
  //                                 ),
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                               ),
  //                               CheckboxListTile(
  //                                 checkColor: Colors.grey.shade600,
  //                                 contentPadding: EdgeInsets.zero,
  //                                 value: typeList[1],
  //                                 onChanged: (value) {
  //                                   setState(() => typeList[1] = value!);
  //                                 },
  //                                 title: Text(
  //                                   LocaleKeys
  //                                       .homePage_filter_seriesName.locale,
  //                                   style: const TextStyle(fontSize: 15),
  //                                 ),
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                               ),
  //                               CheckboxListTile(
  //                                 checkColor: Colors.grey.shade600,
  //                                 contentPadding: EdgeInsets.zero,
  //                                 value: typeList[2],
  //                                 onChanged: (value) {
  //                                   setState(() => typeList[2] = value!);
  //                                 },
  //                                 title: Text(
  //                                   LocaleKeys.homePage_filter_bookName.locale,
  //                                   style: const TextStyle(fontSize: 15),
  //                                 ),
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                         VerticalDivider(
  //                           thickness: 2,
  //                           color: Colors.grey.shade300,
  //                           endIndent: 20,
  //                           indent: 20,
  //                         ),
  //                         Expanded(
  //                           child: Column(
  //                             children: [
  //                               Text(
  //                                 LocaleKeys.homePage_filter_Rate.locale,
  //                                 style: filterTextStyle,
  //                               ),
  //                               const SizedBox(height: 10),
  //                               CheckboxListTile(
  //                                 visualDensity: const VisualDensity(
  //                                     horizontal: -4, vertical: -4),
  //                                 contentPadding: EdgeInsets.zero,
  //                                 checkColor: Colors.grey.shade600,
  //                                 value: false,
  //                                 onChanged: (value) {},
  //                                 title: RateStar(starCount: 5),
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                               ),
  //                               CheckboxListTile(
  //                                 visualDensity: const VisualDensity(
  //                                     horizontal: -4, vertical: -4),
  //                                 contentPadding: EdgeInsets.zero,
  //                                 checkColor: Colors.grey.shade600,
  //                                 value: false,
  //                                 onChanged: (value) {},
  //                                 title: RateStar(starCount: 4),
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                               ),
  //                               CheckboxListTile(
  //                                 visualDensity: const VisualDensity(
  //                                     horizontal: -4, vertical: -4),
  //                                 contentPadding: EdgeInsets.zero,
  //                                 checkColor: Colors.grey.shade600,
  //                                 value: false,
  //                                 onChanged: (value) {},
  //                                 title: RateStar(starCount: 3),
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                               ),
  //                               CheckboxListTile(
  //                                 visualDensity: const VisualDensity(
  //                                     horizontal: -4, vertical: -4),
  //                                 contentPadding: EdgeInsets.zero,
  //                                 checkColor: Colors.grey.shade600,
  //                                 value: false,
  //                                 onChanged: (value) {},
  //                                 title: RateStar(starCount: 2),
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                               ),
  //                               CheckboxListTile(
  //                                 visualDensity: const VisualDensity(
  //                                     horizontal: -4, vertical: -4),
  //                                 contentPadding: EdgeInsets.zero,
  //                                 checkColor: Colors.grey.shade600,
  //                                 value: false,
  //                                 onChanged: (value) {},
  //                                 title: RateStar(starCount: 1),
  //                                 controlAffinity:
  //                                     ListTileControlAffinity.leading,
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: size.height * 0.03),
  //                   Row(
  //                     children: [
  //                       Expanded(
  //                         child: MyButton(
  //                           text: LocaleKeys.homePage_filter_clean.locale,
  //                           onTap: () {
  //                             setState(() => typeList = [false, false, false]);
  //                             debugPrint(typeList.toString());
  //                           },
  //                           myheight: 0.05,
  //                           mycolor: Colors.grey.shade400,
  //                         ),
  //                       ),
  //                       const SizedBox(width: 10),
  //                       Expanded(
  //                         child: MyButton(
  //                           text: LocaleKeys.homePage_filter_filter.locale,
  //                           onTap: () {
  //                             debugPrint(typeList.toString());
  //                             var value = typeListController(typeList);
  //                             ref
  //                                 .watch(fireStoreServiceProvider)
  //                                 .filterCardList(value);

  //                             Navigator.pop(context);
  //                           },
  //                           myheight: 0.05,
  //                           mycolor: Colors.greenAccent,
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // String typeListController(List typeList) {
  //   if (typeList[0]) {
  //     return 'film';
  //   } else {
  //     if (typeList[1]) {
  //       return 'series';
  //     } else {
  //       return 'book';
  //     }
  //   }
  // }

  // Container _itemListContainer(
  //     double height, WidgetRef ref, BuildContext context, List typeList) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //         horizontal: height * 0.018, vertical: height * 0.002),
  //     margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
  //     height: height * 0.67,
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).colorScheme.primary,
  //       borderRadius: BorderRadius.circular(15),
  //       border: Border.all(
  //           color: Theme.of(context).colorScheme.tertiary, width: 1.3),
  //     ),
  //     child: StreamBuilder(
  //       stream: controlStramCard(typeList, ref),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) {
  //           return const Center(
  //             child: Text('errrorr'),
  //           );
  //         }
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         } else {
  //           return ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: snapshot.data!.docs.length,
  //             itemBuilder: (context, index) {
  //               var data = snapshot.data!.docs
  //                   .map((DocumentSnapshot documentSnapshot) =>
  //                       documentSnapshot.data() as Map<String, dynamic>)
  //                   .toList();
  //               final item =
  //                   ItemCard(cardModel: CardModel.fromJson(data[index]));
  //               return Dismissible(
  //                 key: ObjectKey(item),
  //                 background: Container(
  //                   decoration: BoxDecoration(
  //                       color: Colors.red,
  //                       borderRadius: BorderRadius.circular(20)),
  //                   alignment: Alignment.centerRight,
  //                   padding: const EdgeInsets.symmetric(horizontal: 20),
  //                   child: Icon(
  //                     Icons.delete_forever,
  //                     color: Theme.of(context).colorScheme.primary,
  //                     size: 30,
  //                   ),
  //                 ),
  //                 behavior: HitTestBehavior.translucent,
  //                 direction: DismissDirection.endToStart,
  //                 onDismissed: (direction) {
  //                   ref.watch(fireStoreServiceProvider).deleteCard(
  //                         CardModel.fromJson(
  //                           data[index],
  //                         ),
  //                       );
  //                   if (direction == DismissDirection.endToStart) {
  //                     ScaffoldMessenger.of(context).showSnackBar(
  //                       const SnackBar(
  //                         content: Text('Kart silindi!!!'),
  //                         duration: Duration(seconds: 1),
  //                         dismissDirection: DismissDirection.up,
  //                         behavior: SnackBarBehavior.floating,
  //                       ),
  //                     );
  //                   }
  //                 },
  //                 child: ItemCard(
  //                   cardModel: CardModel.fromJson(
  //                     data[index],
  //                   ),
  //                 ),
  //               );
  //             },
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  // Stream<QuerySnapshot<Map<String, dynamic>>> controlStramCard(
  //     List typeList, WidgetRef ref) {
  //   final cardsStream = ref.watch(fireStoreServiceProvider.notifier).getCards();
  //   Stream<QuerySnapshot<Map<String, dynamic>>> searchStream =
  //       ref.watch(fireStoreServiceProvider).cardStream;
  //   Stream<QuerySnapshot<Map<String, dynamic>>> filterCardStream =
  //       ref.watch(fireStoreServiceProvider).cardStream;
  //   if (searchController.text.isEmpty &&
  //       List.from(typeList).every((element) => element == false)) {
  //     return cardsStream;
  //   } else if (searchController.text.isNotEmpty &&
  //       List.from(typeList).every((element) => element == false)) {
  //     return searchStream;
  //   } else {
  //     return filterCardStream;
  //   }
  // }

  // Container _searchContainer(double height, BuildContext context, Size size,
  //     WidgetRef ref, List typeList) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(15),
  //         border: Border.all(color: Theme.of(context).colorScheme.tertiary),
  //         color: Theme.of(context).colorScheme.primary),
  //     margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
  //     height: height * 0.061,
  //     child: TextField(
  //       textAlign: TextAlign.center,
  //       controller: searchController,
  //       decoration: InputDecoration(
  //           prefixIcon: const Icon(Icons.search),
  //           hintText: LocaleKeys.homePage_searchContent.locale,
  //           suffixIcon: IconButton(
  //             onPressed: () {
  //               _searchFilter(size, context, ref, typeList);
  //             },
  //             icon: const Icon(Icons.tune),
  //             splashColor: Colors.transparent,
  //           ),
  //           border: InputBorder.none),
  //       onSubmitted: (value) {
  //         ref.watch(fireStoreServiceProvider).searchCardList(value);
  //       },
  //     ),
  //   );
  // }
}
