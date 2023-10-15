import 'package:flutter/material.dart';
import 'package:mylibrary/widgets/add_form.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.question_mark, size: 30),
              ),
              const Text('myLibrary',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.exit_to_app, size: 30),
              )
            ],
          ),
          SizedBox(
            height: height * 0.035,
          ),
          AddForm()
        ],
      ),
    );
  }
}
