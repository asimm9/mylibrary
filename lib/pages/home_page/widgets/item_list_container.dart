// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';

import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/widgets/item_card.dart';

// ignore: must_be_immutable
class ItemListContainer extends ConsumerWidget {
  TextEditingController searchController;
  double height;
  ItemListContainer({
    super.key,
    required this.searchController,
    required this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        stream: controlStramCard(ref, searchController),
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
                final item =
                    ItemCard(cardModel: CardModel.fromJson(data[index]));
                return Dismissible(
                  key: ObjectKey(item),
                  background: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete_forever,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                  ),
                  behavior: HitTestBehavior.translucent,
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    ref.watch(fireStoreServiceProvider).deleteCard(
                          CardModel.fromJson(
                            data[index],
                          ),
                        );
                    if (direction == DismissDirection.endToStart) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Kart silindi!!!'),
                          duration: Duration(seconds: 1),
                          dismissDirection: DismissDirection.up,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  child: ItemCard(
                    cardModel: CardModel.fromJson(
                      data[index],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

Stream<QuerySnapshot<Map<String, dynamic>>> controlStramCard(
    WidgetRef ref, TextEditingController searchController) {
  List typeList = ref.watch(itemTypeListProvider.notifier).state;
  final cardsStream = ref.watch(fireStoreServiceProvider.notifier).getCards();
  Stream<QuerySnapshot<Map<String, dynamic>>> searchStream =
      ref.watch(fireStoreServiceProvider).cardStream;
  Stream<QuerySnapshot<Map<String, dynamic>>> filterCardStream =
      ref.watch(fireStoreServiceProvider).cardStream;
  if (searchController.text.isEmpty &&
      List.from(typeList).every((element) => element == false)) {
    return cardsStream;
  } else if (searchController.text.isNotEmpty &&
      List.from(typeList).every((element) => element == false)) {
    return searchStream;
  } else {
    return filterCardStream;
  }
}
