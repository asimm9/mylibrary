import 'package:flutter/material.dart';

class ItemRateValue extends ChangeNotifier {
  List<bool> _itemRateList = [false, false, false, false, false];
  List<bool> get itemRateList => _itemRateList;

  List<bool> _itemRateListFavorite = [false, false, false, false, false];
  List<bool> get itemRateListFavorite => _itemRateListFavorite;

  void updateListValue() {
    _itemRateList = List.filled(_itemRateList.length, false);
    _itemRateListFavorite = List.filled(_itemRateList.length, false);

    notifyListeners();
  }
}
