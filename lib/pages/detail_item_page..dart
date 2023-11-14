// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/all_providers.dart';

class ItemDetailPage extends ConsumerStatefulWidget {
  final CardModel cardModel;
  const ItemDetailPage({super.key, required this.cardModel});

  @override
  ConsumerState<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends ConsumerState<ItemDetailPage> {
  bool lastValue = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _appBar(context, widget.cardModel),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(size.height * 0.018),
          height: size.height * 0.85,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
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

  Padding _detailPart(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Film Adı:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  widget.cardModel.itemName.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Yazar Adı:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  widget.cardModel.itemCreater.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'İçerik Hakkınadaa:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  widget.cardModel.shortTextForItem.toString(),
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
              SizedBox(width: 5),
              Text(
                widget.cardModel.itemRate.toString(),
              ),
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
      title: Text('myLibrary', style: appBarTitleTextStyle),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: Theme.of(context).colorScheme.tertiary,
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
          color: Theme.of(context).colorScheme.tertiary,
        )
      ],
    );
  }
}
