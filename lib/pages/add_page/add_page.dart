// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/pages/add_page/widgets/add_page_elevated_button.dart';
import 'package:mylibrary/pages/add_page/widgets/content_type_field.dart';
import 'package:mylibrary/pages/add_page/widgets/creater_name_field.dart';
import 'package:mylibrary/pages/add_page/widgets/custom_slider.dart';
import 'package:mylibrary/pages/add_page/widgets/selected_item_type.dart';
import 'package:mylibrary/pages/add_page/widgets/summary_text_field.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class AddForm extends ConsumerStatefulWidget {
  const AddForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<AddForm> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ContentNameField(
              contentTypeNameController: _contentTypeNameController),
          CreaterNameField(createrNameController: _createrNameController),
          SummaryTextField(
              summaryTextController: _summaryTextController, height: height),
          SelectedItemType(itemType: itemType),
          const CustomSlider(),
          AddPageElevatedButton(
              fireStoreService: fireStoreService,
              uuid: _uuid,
              createrNameController: _createrNameController,
              contentTypeNameController: _contentTypeNameController,
              summaryTextController: _summaryTextController,
              currentSliderValue: ref.watch(currentSliderValueProvider))
        ],
      ),
    );
  }
}
