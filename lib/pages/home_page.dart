import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/widgets/item_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        _searchContainer(size.height),
        Padding(padding: EdgeInsets.all(size.height * 0.018)),
        _itemListContainer(size.height)
      ],
    );
  }

  Container _itemListContainer(double height) {
    return Container(
      padding: EdgeInsets.all(height * 0.018),
      margin: const EdgeInsets.fromLTRB(21, 0, 21, 0),
      height: height * 0.67,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 1.3),
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
                    shortTextForItem:
                        'nahfbasjbfhasjbfs'));
          },
          itemCount: 1),
    );
  }

  Container _searchContainer(double height) {
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
