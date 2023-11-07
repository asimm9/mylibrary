import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/widgets/item_card.dart';

class FavoritesPage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        _searchField(height),
        Padding(padding: EdgeInsets.all(height * 0.018)),
        _itemListField(height),
        Padding(padding: EdgeInsets.all(height * 0.008)),
        const Text('Favorilerden Çıkarmak için sola doğru kaydırınız')
      ],
    );
  }

  Container _itemListField(double height) {
    return Container(
      padding: EdgeInsets.all(height * 0.018),
      margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
      height: height * 0.62,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 1.2),
      ),
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return ItemCard(
              cardModel: CardModel(
            createTime: DateTime.now(),
            id: '5',
            isFavorite: true,
            itemCreater: 'asda',
            itemName: 'adsadas',
            itemRate: 5,
            itemType: 'adssadas',
            shortTextForItem: 'fdsdfsdfdsf',
          ));
        },
      ),
    );
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
