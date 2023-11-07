class CardModel {
  String? id;
  String? itemName;
  String? itemCreater;
  String? shortTextForItem;
  double? itemRate;
  bool? isFavorite;
  DateTime? createTime;
  String? itemType;

  CardModel({
    this.id,
    this.itemType,
    this.itemName,
    this.createTime,
    this.isFavorite,
    this.itemCreater,
    this.itemRate,
    this.shortTextForItem,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> mapToSaved = {
      'id': id,
      'itemName': itemName,
      'itemCreater': itemCreater,
      'shortTextForItem': shortTextForItem,
      'itemRate': itemRate,
      'isFavorite': isFavorite,
      'createTime': createTime,
      'itemType': itemType
    };

    return mapToSaved;
  }

  factory CardModel.fromJson(Map<String, dynamic> map) {
    CardModel cardModel = CardModel(
        id: map['id'],
        itemType: map['itemType'],
        itemName: map['itemName'],
        createTime: map['createTime'],
        isFavorite: map['isFavorite'],
        itemCreater: map['itemCreater'],
        itemRate: map['itemRate'],
        shortTextForItem: map['shortTextForItem']);

    return cardModel;
  }
}
