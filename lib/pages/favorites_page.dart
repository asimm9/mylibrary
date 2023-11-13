import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/widgets/item_card.dart';

import '../providers/all_providers.dart';

class FavoritesPage extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();
  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Stream<QuerySnapshot<Map<String, dynamic>>> _favoriteCardsStream =
        ref.watch(fireStoreServiceProvider.notifier).getFavoriteList();
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        _searchField(height),
        Padding(padding: EdgeInsets.all(height * 0.018)),
        _itemListField(height, _favoriteCardsStream),
        Padding(padding: EdgeInsets.all(height * 0.008)),
        const Text('Favorilerden Çıkarmak için sola doğru kaydırınız')
      ],
    );
  }

  Container _itemListField(double height,
      Stream<QuerySnapshot<Map<String, dynamic>>> _favoriteCardsStream) {
    return Container(
        padding: EdgeInsets.all(height * 0.018),
        margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
        height: height * 0.62,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 1.2),
        ),
        child: StreamBuilder(
          stream: _favoriteCardsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('loading');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  List<Map<String, dynamic>> data = snapshot.data!.docs
                      .map((DocumentSnapshot documentSnapshot) =>
                          documentSnapshot.data() as Map<String, dynamic>)
                      .toList();
                  return ItemCard(cardModel: CardModel.fromJson(data[index]));
                },
              );
            }
          },
        ));
  }

  Container _searchField(double height) {
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
