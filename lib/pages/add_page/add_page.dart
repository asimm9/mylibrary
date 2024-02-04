// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/pages/add_page/widgets/add_page_elevated_button.dart';
import 'package:mylibrary/pages/add_page/widgets/custom_slider.dart';
import 'package:mylibrary/pages/add_page/widgets/selected_item_type.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/services/firestore_service.dart';
import 'package:mylibrary/widgets/my_text_field.dart';
import 'package:uuid/uuid.dart';

class AddForm extends ConsumerStatefulWidget {
  const AddForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<AddForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _contentTypeNameController =
      TextEditingController();
  final TextEditingController _createrNameController = TextEditingController();
  final TextEditingController _summaryTextController = TextEditingController();
  final Uuid _uuid = const Uuid();
  ItemType? selectedItemType;

  @override
  Widget build(BuildContext context) {
    ItemType? itemType;
    FireStoreService fireStoreService = ref.watch(fireStoreServiceProvider);
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.8,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTextField(
              textController: _contentTypeNameController,
              hintText: LocaleKeys.addPage_contentType.locale,
              validatorFunction: (value) {
                if (value!.isEmpty) {
                  return LocaleKeys.validators_pleaseFillInThisField.locale;
                }
                return null;
              },
            ),
            MyTextField(
              textController: _createrNameController,
              hintText: LocaleKeys.addPage_writerOrDirectorName.locale,
              validatorFunction: (value) {
                if (value!.isEmpty) {
                  return LocaleKeys.validators_pleaseFillInThisField.locale;
                }
                return null;
              },
            ),
            MyTextField(
              textController: _summaryTextController,
              hintText: LocaleKeys.addPage_mentionAboutTheContent.locale,
              height: height * 0.26,
              maxLines: 8,
              minLines: 8,
              validatorFunction: (value) {
                if (value!.isEmpty) {
                  return LocaleKeys.validators_pleaseFillInThisField.locale;
                }
                return null;
              },
            ),
            SelectedItemType(itemType: itemType),
            CustomSlider(),
            AddPageElevatedButton(
              fireStoreService: fireStoreService,
              uuid: _uuid,
              createrNameController: _createrNameController,
              contentTypeNameController: _contentTypeNameController,
              summaryTextController: _summaryTextController,
              currentSliderValue: ref.watch(currentSliderValueProvider),
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
