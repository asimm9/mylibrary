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
          SizedBox(
            height: height * 0.035,
          ),
          AddForm()
        ],
      ),
    );
  }
}
