import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  Uuid _uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    FireStoreService fireStoreService = ref.watch(fireStoreServiceProvider);
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.76,
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
      style: const ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(150, 10)),
          backgroundColor: MaterialStatePropertyAll(Colors.black)),
      onPressed: () {
        fireStoreService.saveCard(CardModel(
            id: _uuid.v4(),
            createTime: 'asdsad',
            isFavorite: false,
            itemCreater: _createrNameController.text,
            itemName: _filmNameController.text,
            itemRate: _currentSliderValue.toInt(),
            itemType: 'film',
            shortTextForItem: _itemSumController.text));
      },
      child: const Text('Ekle'),
    );
  }

  Slider _customSlider() {
    return Slider(
      thumbColor: Colors.black,
      inactiveColor: Colors.black,
      secondaryActiveColor: Colors.black,
      activeColor: Colors.black,
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
          fillColor: Colors.white,
          hintText: 'İçerikten kısaca bahset',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
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
        fillColor: Colors.white,
        hintText: 'Yazar veya yönetmen adı',
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  TextField _fieldNameField() {
    return TextField(
      controller: _filmNameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Film adı',
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
