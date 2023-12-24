import 'package:flutter/material.dart';

class ItemList extends ChangeNotifier {
  List<String> _itemTypeList = [];
  List<String> get typeList => _itemTypeList;

  updateItemList() {
    _itemTypeList = [];
    notifyListeners();
  }
}
