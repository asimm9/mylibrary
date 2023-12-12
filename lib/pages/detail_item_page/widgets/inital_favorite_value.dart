// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InitalFavoriteValue extends StatelessWidget {
  bool boolValue;
  InitalFavoriteValue({
    Key? key,
    required this.boolValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (boolValue) {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.favorite_border_rounded,
        size: 30,
      );
    }
  }
}
