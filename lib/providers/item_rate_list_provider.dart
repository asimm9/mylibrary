import 'package:flutter/material.dart';

class ItemRataList extends ChangeNotifier {
  List<int> _itemRateList = [];
  List<int> get itemRateList => _itemRateList;

  updateItemList() {
    _itemRateList = [];
    notifyListeners();
  }
}
