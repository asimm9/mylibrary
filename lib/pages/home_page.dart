import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/widgets/item_card.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [
      _searchContainer(size.height, context, size),
      Padding(padding: EdgeInsets.all(size.height * 0.018)),
      _itemListContainer(size.height, ref, context),
    ]);
  }

  // Container _searchFilter(Size size) {
  //   return Container(
  //     alignment: Alignment.center,
  //     width: size.width * 0.4,
  //     height: size.height * 0.18,
  //     decoration: BoxDecoration(color: Colors.grey.shade100),
  //     child: Column(
  //       children: [
  //         CheckboxListTile(
  //           checkColor: Colors.grey.shade600,
  //           contentPadding: EdgeInsets.zero,
  //           value: true,
  //           onChanged: (value) {},
  //           title: const Text(
  //             'Film Adı',
  //             style: TextStyle(fontSize: 15),
  //           ),
  //           controlAffinity: ListTileControlAffinity.leading,
  //         ),
  //         CheckboxListTile(
  //           checkColor: Colors.grey.shade600,
  //           contentPadding: EdgeInsets.zero,
  //           value: true,
  //           onChanged: (value) {},
  //           title: const Text(
  //             'Dizi Adı',
  //             style: TextStyle(fontSize: 15),
  //           ),
  //           controlAffinity: ListTileControlAffinity.leading,
  //         ),
  //         CheckboxListTile(
  //           checkColor: Colors.grey.shade600,
  //           contentPadding: EdgeInsets.zero,
  //           value: true,
  //           onChanged: (value) {},
  //           title: const Text(
  //             'Kitap Adı',
  //             style: TextStyle(fontSize: 15),
  //           ),
  //           controlAffinity: ListTileControlAffinity.leading,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Container _itemListContainer(
      double height, WidgetRef ref, BuildContext context) {
    var cardsStream = ref.watch(fireStoreServiceProvider.notifier).getCards();
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: height * 0.018, vertical: height * 0.002),
      margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
      height: height * 0.67,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
            color: Theme.of(context).colorScheme.tertiary, width: 1.3),
      ),
      child: StreamBuilder(
        stream: cardsStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('errrorr'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data!.docs
                    .map((DocumentSnapshot documentSnapshot) =>
                        documentSnapshot.data() as Map<String, dynamic>)
                    .toList();
                return ItemCard(cardModel: CardModel.fromJson(data[index]));
              },
            );
          }
        },
      ),
    );
  }

  Container _searchContainer(double height, BuildContext context, Size size) {
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
            hintText: 'içerik ismini arayınız',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune),
              splashColor: Colors.transparent,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
