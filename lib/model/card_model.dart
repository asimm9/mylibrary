// ignore_for_file: constant_identifier_names

enum ItemType { SERIES, FILM, BOOK }

class CardModel {
  String itemName;
  String itemCreater;
  String shortTextForItem;
  int itemRate;
  bool isFavorite;
  DateTime createTime;

  CardModel({
    required this.itemName,
    required this.createTime,
    required this.isFavorite,
    required this.itemCreater,
    required this.itemRate,
    required this.shortTextForItem,
  });
}
