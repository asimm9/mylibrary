// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/services/firestore_service.dart';
import 'package:mylibrary/widgets/my_snack_bar.dart';

class AddPageElevatedButton extends ConsumerWidget {
  final FireStoreService fireStoreService;
  final Uuid uuid;
  final TextEditingController createrNameController;
  final TextEditingController contentTypeNameController;
  final TextEditingController summaryTextController;
  final double currentSliderValue;
  final GlobalKey<FormState> formKey;
  const AddPageElevatedButton({
    Key? key,
    required this.fireStoreService,
    required this.uuid,
    required this.createrNameController,
    required this.contentTypeNameController,
    required this.summaryTextController,
    required this.currentSliderValue,
    required this.formKey,
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
          MySnackBar.snackBar(
              context, LocaleKeys.validators_pleaseChooseType.locale, 2);
          return;
        }
        if (formKey.currentState!.validate()) {
          try {
            await fireStoreService.saveCard(
              CardModel(
                  id: uuid.v4(),
                  createTime: fireStoreService.formatTimeStamp(Timestamp.now()),
                  isFavorite: false,
                  itemCreater: createrNameController.text,
                  itemName: contentTypeNameController.text,
                  itemRate: currentSliderValue.toInt(),
                  itemType:
                      ref.watch(selectedItemtypeProvider.notifier).state!.name,
                  shortTextForItem: summaryTextController.text),
            );
          } on FirebaseAuthException {
            MySnackBar.snackBar(
                context, LocaleKeys.validators_cardPleaseTryAgain.locale, 2);
          }
        } else {
          return;
        }

        ref.watch(selectedItemtypeProvider.notifier).state = null;
      },
      child: Text(
        LocaleKeys.addPage_add.locale,
        style: addButtonTextStyle,
      ),
    );
  }
}
