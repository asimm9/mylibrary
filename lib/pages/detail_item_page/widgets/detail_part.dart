import 'package:flutter/material.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/model/card_model.dart';

class DetailPart extends StatelessWidget {
  final CardModel cardModel;
  const DetailPart({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: size.width * 0.03),
              Flexible(
                child: Text(
                  cardModel.itemName.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.detailPage_writerName.locale,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: size.width * 0.03),
              Flexible(
                child: Text(
                  cardModel.itemCreater.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          Row(
            children: [
              Text(
                LocaleKeys.detailPage_aboutContent.locale,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: size.width * 0.03),
            ],
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.28,
              child: Text(
                cardModel.shortTextForItem.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
