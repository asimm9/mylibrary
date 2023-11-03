import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';

class ItemCard extends StatelessWidget {
  final CardModel cardModel;
  ItemCard({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(cardModel.itemRate!.toStringAsFixed(2)),
          Icon(
            Icons.star,
            size: 20,
            color: Colors.yellow.shade400,
          )
        ]),
        title: Text(cardModel.itemName!),
        subtitle: Text(cardModel.itemType!),
        trailing: const Icon(Icons.info_rounded),
      ),
    );
  }
}
