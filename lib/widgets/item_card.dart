import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/services/local_storage.dart';

class ItemCard extends StatelessWidget {
  final CardModel cardModel;
  ItemCard({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
  

    return Card(
      child: ListTile(
        title: Text(cardModel.itemName!),
        subtitle: Text(cardModel.itemType!),
        trailing: const Icon(Icons.info_rounded),
      ),
    );
  }
}
