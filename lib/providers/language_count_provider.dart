import 'package:flutter/material.dart';

class LanguageCount extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void incrementCount() {
    _count = (_count + 1) % 2;
    notifyListeners();
  }
}
