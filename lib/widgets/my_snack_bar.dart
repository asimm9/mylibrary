import 'package:flutter/material.dart';

class MySnackBar {
  static void snackBar(BuildContext context, String text, int duration) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: duration),
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
