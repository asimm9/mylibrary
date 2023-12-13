// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';

import 'package:mylibrary/providers/all_providers.dart';

class LastRow extends ConsumerWidget {
  final CardModel cardModel;

  const LastRow({
    Key? key,
    required this.cardModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              const SizedBox(width: 5),
              Text(
                cardModel.itemRate.toString(),
              ),
            ],
          ),
          Text(cardModel.createTime!),
          IconButton(
              onPressed: () {
                ref.watch(fireStoreServiceProvider).deleteCard(cardModel);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
    );
  }
}
