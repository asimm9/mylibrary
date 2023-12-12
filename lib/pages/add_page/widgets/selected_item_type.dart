// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/locale_text.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/all_providers.dart';

// ignore: must_be_immutable
class SelectedItemType extends ConsumerStatefulWidget {
  ItemType? itemType;

  SelectedItemType({
    super.key,
    this.itemType,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectedItemTypeState();
}

class _SelectedItemTypeState extends ConsumerState<SelectedItemType> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile<ItemType>(
            contentPadding: EdgeInsets.zero,
            title: LocaleText(text: LocaleKeys.contentType_film),
            activeColor: Colors.black,
            value: ItemType.film,
            groupValue: widget.itemType,
            onChanged: (value) {
              setState(() {
                widget.itemType = value;
              });
              ref.watch(selectedItemtypeProvider.notifier).state =
                  widget.itemType;
            },
          ),
        ),
        Expanded(
          child: RadioListTile<ItemType>(
            contentPadding: EdgeInsets.zero,
            title: LocaleText(
              text: LocaleKeys.contentType_series,
              textStyle: const TextStyle(fontSize: 6),
            ),
            activeColor: Colors.black,
            value: ItemType.series,
            groupValue: widget.itemType,
            onChanged: (value) {
              setState(() {
                widget.itemType = value;
              });
              ref.watch(selectedItemtypeProvider.notifier).state =
                  widget.itemType;
            },
          ),
        ),
        Expanded(
          child: RadioListTile<ItemType>(
            contentPadding: EdgeInsets.zero,
            title: LocaleText(text: LocaleKeys.contentType_book),
            activeColor: Colors.black,
            value: ItemType.book,
            groupValue: widget.itemType,
            onChanged: (value) {
              setState(() {
                widget.itemType = value;
              });
              ref.watch(selectedItemtypeProvider.notifier).state =
                  widget.itemType;
            },
          ),
        ),
      ],
    );
  }
}
