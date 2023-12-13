// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/pages/detail_item_page/widgets/app_bar.dart';
import 'package:mylibrary/pages/detail_item_page/widgets/detail_part.dart';
import 'package:mylibrary/pages/detail_item_page/widgets/inital_favorite_value.dart';
import 'package:mylibrary/pages/detail_item_page/widgets/last_row.dart';
import 'package:mylibrary/providers/all_providers.dart';

class ItemDetailPage extends ConsumerStatefulWidget {
  final CardModel cardModel;
  const ItemDetailPage({super.key, required this.cardModel});

  @override
  ConsumerState<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends ConsumerState<ItemDetailPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    InitalFavoriteValue(
        boolValue: ref.watch(fireStoreServiceProvider).currentValue);
    ref.watch(fireStoreServiceProvider).getCurrentBoolValue(widget.cardModel);
  }

  @override
  Widget build(BuildContext context) {
    bool lastValue = ref.watch(fireStoreServiceProvider).lastValue;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBarWidget(cardModel: widget.cardModel, lastValue: lastValue),
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
