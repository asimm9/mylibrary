import 'package:flutter/material.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/model/card_model.dart';

class DetailPart extends StatelessWidget {
  final CardModel cardModel;
  const DetailPart({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.detailPage_filmName.locale,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  cardModel.itemName.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                LocaleKeys.detailPage_writerName.locale,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  cardModel.itemCreater.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                LocaleKeys.detailPage_aboutContent.locale,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  cardModel.shortTextForItem.toString(),
                  maxLines: 1,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
