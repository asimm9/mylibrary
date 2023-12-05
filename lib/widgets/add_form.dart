import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/companants/text_style.dart';
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
        fireStoreService.saveCard(CardModel(
            id: _uuid.v4(),
            createTime: 'asdsad',
            isFavorite: false,
            itemCreater: _createrNameController.text,
            itemName: _filmNameController.text,
            itemRate: _currentSliderValue.toInt(),
            itemType: selectedItemType!.name,
            shortTextForItem: _itemSumController.text));
      },
      child: Text(
        'Ekle',
        style: addButtonTextStyle,
      ),
    );
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
      height: height * 0.33,
      child: TextField(
        minLines: 8,
        maxLines: 8,
        controller: _itemSumController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          hintText: 'İçerikten kısaca bahset',
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
      ),
    );
  }

  TextField _createrNameField() {
    return TextField(
      controller: _createrNameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        hintText: 'Yazar veya yönetmen adı',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  TextField _fieldNameField() {
    return TextField(
      controller: _filmNameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        hintText: 'Film adı',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Future<ItemType?> _showDialog(
      BuildContext context, ItemType? itemType) async {
    Completer<ItemType?> _completer = Completer<ItemType?>();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seçilen Tür'),
          content: Container(
            height: 200,
            child: StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  ListTile(
                    title: Text('film'),
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
                    title: Text('dizi'),
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
                    title: Text('kitap'),
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
              onPressed: () {
                Navigator.of(context).pop();
                _completer.complete(itemType); // Close the dialog
              },
              child: Text('TAMAM(TR)'),
            ),
          ],
        );
      },
    );
    return _completer.future;
  }
}
