import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mylibrary/model/card_model.dart';

class ItemDetailPage extends StatelessWidget {
  final CardModel cardModel;
  const ItemDetailPage({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 250, 244, 1),
      appBar: _appBar(context),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(size.height * 0.018),
          height: size.height * 0.85,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Film Adı:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Yazar Adı:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'içerik hakkında:',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardModel.itemName.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        cardModel.itemCreater.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        cardModel.shortTextForItem.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              _lastRow()
            ],
          ),
        ),
      ),
    );
  }

  Padding _lastRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(cardModel.itemRate.toString()),
            ],
          ),
          Text(cardModel.createTime!.year.toString()),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'myLibrary',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_rounded, size: 30),
          color: Colors.black,
        )
      ],
    );
  }
}
