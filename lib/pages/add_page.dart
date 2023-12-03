import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mylibrary/model/card_model.dart';
import 'package:mylibrary/widgets/add_form.dart';

class AddPage extends ConsumerStatefulWidget {
  const AddPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _showDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.035,
        ),
        const AddForm()
      ],
    );
  }

  void _showDialog(BuildContext context) {
    ItemType? itemType = ItemType.film;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seçilen Tür'),
          content: Container(
            height: 200,
            child: Column(
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
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
