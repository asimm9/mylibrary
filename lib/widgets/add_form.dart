// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/text_style.dart';
import 'package:mylibrary/localizations/language/locale_keys.g.dart';
import 'package:mylibrary/localizations/string_extensions.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/providers/all_providers.dart';
import 'package:mylibrary/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class AddForm extends ConsumerStatefulWidget {
  const AddForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddFormState();
}

class _AddFormState extends ConsumerState<AddForm> {
  final TextEditingController _filmNameController = TextEditingController();
  final TextEditingController _createrNameController = TextEditingController();
  final TextEditingController _itemSumController = TextEditingController();
  double _currentSliderValue = 0;
  final Uuid _uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    ItemType? itemType;
    FireStoreService fireStoreService = ref.watch(fireStoreServiceProvider);
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.72,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _fieldNameField(),
          _createrNameField(),
          _summaryTextField(height),
          _selectedItemType(itemType),
          _customSlider(),
          _customElevatedButton(fireStoreService)
        ],
      ),
    );
  }

  ElevatedButton _customElevatedButton(FireStoreService fireStoreService) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: const MaterialStatePropertyAll(Size(150, 10)),
          backgroundColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.tertiary)),
      onPressed: () async {
        ItemType? itemType;
        final selectedItemType = await _showDialog(context, itemType);
        fireStoreService.saveCard(
          CardModel(
              id: _uuid.v4(),
              createTime: 'asdsad',
              isFavorite: false,
              itemCreater: _createrNameController.text,
              itemName: _filmNameController.text,
              itemRate: _currentSliderValue.toInt(),
              itemType: selectedItemType!.name,
              shortTextForItem: _itemSumController.text),
        );
      },
      child: Text(
        LocaleKeys.addPage_add.locale,
        style: addButtonTextStyle,
      ),
    );
  }

  Future<ItemType?> controlType(ItemType? itemType) async {
    var selectedItemType = await _showDialog(context, itemType);
    if (selectedItemType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen bir tip seçiniz!!!'),
          duration: Duration(seconds: 2),
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    while (selectedItemType == null) {
      selectedItemType = await _showDialog(context, itemType);
    }
    return selectedItemType;
  }

  Slider _customSlider() {
    return Slider(
      thumbColor: Theme.of(context).colorScheme.tertiary,
      inactiveColor: Theme.of(context).colorScheme.tertiary,
      secondaryActiveColor: Theme.of(context).colorScheme.tertiary,
      activeColor: Theme.of(context).colorScheme.tertiary,
      label: _currentSliderValue.round().toString(),
      divisions: 10,
      max: 10,
      value: _currentSliderValue,
      onChanged: (value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }

  SizedBox _summaryTextField(double height) {
    return SizedBox(
      height: height * 0.26,
      child: TextFormField(
        minLines: 8,
        maxLines: 8,
        controller: _itemSumController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: LocaleKeys.addPage_mentionAboutTheContent.locale,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
              borderRadius: BorderRadius.circular(15)),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Zorunlu!';
          }
          return null;
        },
      ),
    );
  }

  TextFormField _createrNameField() {
    return TextFormField(
      controller: _createrNameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        hintText: LocaleKeys.addPage_writerOrDirectorName.locale,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
            borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Zorunlu!';
        }
        return null;
      },
    );
  }

  TextFormField _fieldNameField() {
    return TextFormField(
      controller: _filmNameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        hintText: LocaleKeys.addPage_contentType.locale,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
            borderRadius: BorderRadius.circular(15)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Zorunlu!';
        }
        return null;
      },
    );
  }

  Future<ItemType?> _showDialog(
      BuildContext context, ItemType? itemType) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seçilen Tür'),
          content: SizedBox(
            height: 200,
            child: StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  ListTile(
                    title: const Text('film'),
                    leading: Radio<ItemType>(
                      activeColor: Colors.black,
                      value: ItemType.film,
                      groupValue: itemType,
                      onChanged: (value) {
                        setState(() {
                          itemType = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('dizi'),
                    leading: Radio<ItemType>(
                      activeColor: Colors.black,
                      value: ItemType.series,
                      groupValue: itemType,
                      onChanged: (value) {
                        setState(() {
                          itemType = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('kitap'),
                    leading: Radio<ItemType>(
                      activeColor: Colors.black,
                      value: ItemType.book,
                      groupValue: itemType,
                      onChanged: (value) {
                        setState(() {
                          itemType = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.tertiary)),
              onPressed: () {
                Navigator.of(context).pop(itemType);
              },
              child: const Text('TAMAM(TR)'),
            ),
          ],
        );
      },
    );
  }

  _selectedItemType(ItemType? itemType) {
    return StatefulBuilder(
      builder: (context, setState) => Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('film'),
              leading: Radio<ItemType>(
                activeColor: Colors.black,
                value: ItemType.film,
                groupValue: itemType,
                onChanged: (value) {
                  setState(() {
                    itemType = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('dizi'),
              leading: Radio<ItemType>(
                activeColor: Colors.black,
                value: ItemType.series,
                groupValue: itemType,
                onChanged: (value) {
                  setState(() {
                    itemType = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('kitap'),
              leading: Radio<ItemType>(
                activeColor: Colors.black,
                value: ItemType.book,
                groupValue: itemType,
                onChanged: (value) {
                  setState(() {
                    itemType = value;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
