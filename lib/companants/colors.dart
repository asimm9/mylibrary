import 'package:flutter/material.dart';

Color backgroundColor = const Color.fromRGBO(255, 250, 244, 1);

Color textFieldCursorColor(BuildContext context) {
  return Theme.of(context).colorScheme.surface;
}

List<Color> colorizeColors = [
  Colors.blueGrey.shade800,
  Colors.grey.shade400,
  backgroundColor,
  Colors.white,
];
