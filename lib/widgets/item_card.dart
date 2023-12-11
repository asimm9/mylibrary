import 'package:flutter/material.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/pages/detail_item_page/detail_item_page..dart';

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
          side: BorderSide(color: colorControl(), width: 2.5),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          tileColor: Theme.of(context).colorScheme.secondary,
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
          subtitle: Text(controItemType()),
          trailing: const Icon(Icons.info, size: 33),
        ),
      ),
    );
  }

  Color colorControl() {
    if (cardModel.itemType == 'series') {
      return Colors.pink.shade400;
    } else if (cardModel.itemType == 'book') {
      return Colors.green.shade400;
    } else {
      return Colors.orange.shade400;
    }
  }

  String controItemType() {
    if (cardModel.itemType == 'film') {
      return LocaleKeys.contentType_film.locale;
    } else if (cardModel.itemType == 'series') {
      return LocaleKeys.contentType_series.locale;
    } else {
      return LocaleKeys.contentType_book.locale;
    }
  }
}
