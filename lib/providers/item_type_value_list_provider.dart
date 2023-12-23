import 'package:flutter/material.dart';

class ItemTypeValue extends ChangeNotifier {
  List<bool> _typeList = [false, false, false];
  List<bool> get typeList => _typeList;

  List<bool> _typeListFavorite = [false, false, false];
  List<bool> get typeListFavorite => _typeListFavorite;

  void updateListValue() {
    _typeList = List.filled(_typeList.length, false);
    _typeListFavorite = List.filled(_typeList.length, false);

    notifyListeners();
  }
}
