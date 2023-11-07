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

    return Column(
      children: [
        _searchContainer(size.height),
        Padding(padding: EdgeInsets.all(size.height * 0.018)),
        _itemListContainer(size.height, ref)
      ],
    );
  }

  Container _itemListContainer(double height, WidgetRef ref) {
    return Container(
        padding: EdgeInsets.all(height * 0.018),
        margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
        height: height * 0.67,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1.3),
        ),
        child: StreamBuilder(
          stream: ref.watch(fireStoreServiceProvider).getCards(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                      snapshot.data!.docs;

                  return ItemCard(
                      cardModel: CardModel.fromJson(
                          data[index] as Map<String, dynamic>));
                },
              );
            }
          },
        ));
  }

  Container _searchContainer(double height) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black),
          color: Colors.white),
      margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
      height: height * 0.061,
      child: TextField(
        textAlign: TextAlign.center,
        controller: searchController,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.black,
            hintText: 'içerik ismini arayınız',
            suffixIconColor: Colors.black,
            suffixIcon: Icon(Icons.tune),
            border: InputBorder.none),
      ),
    );
  }
}
