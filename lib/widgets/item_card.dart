import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/pages/detail_item_page..dart';

class ItemCard extends StatelessWidget {
  final CardModel cardModel;
  const ItemCard({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(cardModel: cardModel),
          ),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.orange.shade700, width: 2.5),
        ),
        child: ListTile(
          leading:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(cardModel.itemRate!.toStringAsFixed(2)),
            Icon(
              Icons.star,
              size: 20,
              color: Colors.yellow.shade400,
            )
          ]),
          title: Text(cardModel.itemName!),
          subtitle: Text(cardModel.itemType!),
          trailing: const Icon(Icons.info, size: 33),
        ),
      ),
    );
  }
}
