import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/services/local_storage.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final TextEditingController _filmNameController = TextEditingController();
  final TextEditingController _createrNameController = TextEditingController();
  final TextEditingController _itemSumController = TextEditingController();
  double _currentSliderValue = 0;
  final CardModel cardModel = CardModel();
  final LocalStorageService localStorageService = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.76,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'lütfen bir şeyler giriniz';
              } else {
                return null;
              }
            },
            controller: _filmNameController,
            decoration: InputDecoration(
              hintText: 'Film adı',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'lütfen bir şeyler giriniz';
              } else {
                return null;
              }
            },
            controller: _createrNameController,
            decoration: InputDecoration(
              hintText: 'Yazar veya yönetmen adı',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          SizedBox(
            height: height * 0.35,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'lütfen bir şeyler giriniz';
                } else {
                  return null;
                }
              },
              minLines: 8,
              maxLines: 8,
              controller: _itemSumController,
              decoration: InputDecoration(
                hintText: 'İçerikten kısaca bahset',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Slider(
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
          ),
          ElevatedButton(
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(150, 10)),
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
            onPressed: () {
              cardModel.toJson();
            },
            child: const Text('Ekle'),
          )
        ],
      ),
    );
  }
}
