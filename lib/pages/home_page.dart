import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
          height: height * 0.061,
          child: TextField(
            textAlign: TextAlign.center,
            controller: searchController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
                hintText: 'içerik ismini arayınız',
                suffixIconColor: Colors.black,
                suffixIcon: const Icon(Icons.tune),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        Padding(padding: EdgeInsets.all(height * 0.018)),
        Container(
          margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
          height: height * 0.70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black38),
          ),
          child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemCard(
                    cardModel: CardModel(
                        createTime: DateTime.now(),
                        id: 5,
                        isFavorite: true,
                        itemCreater: 'asdasd',
                        itemName: 'film1',
                        itemRate: 5,
                        itemType: 'film',
                        shortTextForItem: 'adsadsdas'));
              },
              itemCount: 1),
        )
      ],
    ));
  }
}
