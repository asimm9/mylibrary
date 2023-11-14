import 'package:flutter/material.dart';
import 'package:mylibrary/companants/text_style.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            height: 20.0,
            thickness: 2,
            indent: 20,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('OR', style: dividerTextStyle),
        ),
        const Expanded(
          child: Divider(
            height: 20.0,
            thickness: 2,
            color: Colors.grey,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
