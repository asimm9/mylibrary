import 'package:flutter/material.dart';

class ItemTypeValue extends ChangeNotifier {
  List<bool> _typeList = [false, false, false];
  List<bool> get typeList => _typeList;

  void updateListValue() {
    _typeList = List.filled(_typeList.length, false);
    notifyListeners();
  }
}
