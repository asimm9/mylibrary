import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/all_providers.dart';

class ItemDetailPage extends ConsumerStatefulWidget {
  final CardModel cardModel;
  ItemDetailPage({super.key, required this.cardModel});

  @override
  ConsumerState<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends ConsumerState<ItemDetailPage> {
  bool lastValue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 250, 244, 1),
      appBar: _appBar(context, widget.cardModel),
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
            children: [_detailPart(size), _lastRow()],
          ),
        ),
      ),
    );
  }

  Row _detailPart(Size size) {
    return Row(
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
              widget.cardModel.itemName.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              widget.cardModel.itemCreater.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              widget.cardModel.shortTextForItem.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
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
              Text(widget.cardModel.itemRate.toString()),
            ],
          ),
          Text(widget.cardModel.createTime!),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context, CardModel cardModel) {
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
          onPressed: () {
            if (lastValue == false) {
              setState(() {
                lastValue = true;
              });
            } else {
              setState(() {
                lastValue = false;
              });
            }
            ref
                .watch(fireStoreServiceProvider)
                .controlFavorite(cardModel.id!, lastValue);
          },
          icon: lastValue == true
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite_border_rounded, size: 30),
          color: Colors.black,
        )
      ],
    );
  }
}
