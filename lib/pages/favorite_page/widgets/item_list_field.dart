// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/widgets/item_card.dart';

// ignore: must_be_immutable
class ItemListField extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  double height;
  Stream<QuerySnapshot<Map<String, dynamic>>> favoriteCardsStream;
  Stream<QuerySnapshot<Map<String, dynamic>>> searchCardsStream;
  ItemListField({
    Key? key,
    required this.height,
    required this.favoriteCardsStream,
    required this.searchCardsStream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: height * 0.018, vertical: height * 0.002),
        margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
        height: height * 0.62,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: Theme.of(context).colorScheme.tertiary, width: 1.2),
        ),
        child: StreamBuilder(
          stream: searchController.text.isEmpty
              ? favoriteCardsStream
              : searchCardsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text('loading');
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
}
