import 'package:flutter/material.dart';

class ShowPage extends ChangeNotifier {
  bool showPageChange = true;
  showPageChangeFunction() {
    showPageChange = !showPageChange;
    notifyListeners();
  }
}
