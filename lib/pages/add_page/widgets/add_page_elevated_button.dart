// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/widgets/my_snack_bar.dart';
import 'package:uuid/uuid.dart';

import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/services/firestore_service.dart';

class AddPageElevatedButton extends ConsumerWidget {
  final FireStoreService fireStoreService;
  final Uuid uuid;
  final TextEditingController createrNameController;
  final TextEditingController contentTypeNameController;
  final TextEditingController summaryTextController;
  final double currentSliderValue;

  const AddPageElevatedButton({
    Key? key,
    required this.fireStoreService,
    required this.uuid,
    required this.createrNameController,
    required this.contentTypeNameController,
    required this.summaryTextController,
    required this.currentSliderValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(Size(150, 10)),
          backgroundColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.tertiary)),
      onPressed: () async {
        if (ref.watch(selectedItemtypeProvider.notifier).state == null) {
          MySnackBar.snackBar(context, 'Lütfen bir tip seçiniz!!!', 2);
          return;
        }
        fireStoreService.saveCard(
          CardModel(
              id: uuid.v4(),
              createTime: 'asdsad',
              isFavorite: false,
              itemCreater: createrNameController.text,
              itemName: contentTypeNameController.text,
              itemRate: currentSliderValue.toInt(),
              itemType:
                  ref.watch(selectedItemtypeProvider.notifier).state!.name,
              shortTextForItem: summaryTextController.text),
        );
        ref.watch(selectedItemtypeProvider.notifier).state = null;
      },
      child: Text(
        LocaleKeys.addPage_add.locale,
        style: addButtonTextStyle,
      ),
    );
  }
}
