import 'package:flutter/material.dart';

TextStyle loginPageTextStyle = const TextStyle(
    fontFamily: 'Roboto', fontSize: 32, fontWeight: FontWeight.w600);

TextStyle myButtonTextStyle = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.blueGrey);

TextStyle dividerTextStyle = const TextStyle(
    color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500);

TextStyle addButtonTextStyle = const TextStyle(
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

TextStyle appBarTitleTextStyle = const TextStyle(
    fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w400);

TextStyle filterTextStyle = const TextStyle(
    fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w400);

TextStyle textFieldTextColor(BuildContext context) {
  return TextStyle(color: Theme.of(context).colorScheme.surface);
}

Color textFieldCursorColor(BuildContext context) {
  return Theme.of(context).colorScheme.surface;
}
