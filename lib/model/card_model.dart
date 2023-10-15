// ignore_for_file: constant_identifier_names

class CardModel {
  String itemName;
  String itemCreater;
  String shortTextForItem;
  int itemRate;
  bool isFavorite;
  DateTime createTime;
  String itemType;

  CardModel({
    required this.itemType,
    required this.itemName,
    required this.createTime,
    required this.isFavorite,
    required this.itemCreater,
    required this.itemRate,
    required this.shortTextForItem,
  });
}
