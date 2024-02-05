// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/pages/detail_item_page/widgets/app_bar.dart';
import 'package:mylibrary/pages/detail_item_page/widgets/detail_part.dart';
import 'package:mylibrary/pages/detail_item_page/widgets/last_row.dart';

class ItemDetailPage extends ConsumerStatefulWidget {
  final CardModel cardModel;
  const ItemDetailPage({super.key, required this.cardModel});

  @override
  ConsumerState<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends ConsumerState<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(cardModel: widget.cardModel),
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
            children: [
              DetailPart(cardModel: widget.cardModel),
              LastRow(cardModel: widget.cardModel),
            ],
          ),
        ),
      ),
    );
  }
}
