import 'package:mylibrary/model/card_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalStorageService {
  final String _userDataBaseName = 'UserDatabase';
  final String _userTableName = 'card';
  int version = 1;
  Database? database;

  String columnItemName = 'itemName';
  String columnItemCreater = 'itemCreater';
  String columnShortTextForItem = 'shortTextForItem';
  String columnItemType = 'itemType';
  String columnItemRate = 'itemRate';
  String columdId = 'id';
  String columnIsFavorite = 'isFavorite';

  Future openDB() async {
    database = await openDatabase(
      _userDataBaseName,
      version: version,
      onCreate: (db, version) {
        createTable(db);
      },
    );
  }

  createTable(Database db) async {
    db.execute(
      """CREATE TABLE $_userTableName (
	$columdId	INTEGER UNIQUE,
	$columnItemName	TEXT,
	$columnItemCreater	TEXT,
	$columnItemType	TEXT,
	$columnItemRate	INTEGER,
	$columnShortTextForItem	TEXT,
	$columnIsFavorite	BLOB,
	PRIMARY KEY($columdId" AUTOINCREMENT))""",
    );
  }

  Future<List<CardModel>> getList() async {
    List<Map<String, dynamic>> cardMaps = await database!.query(_userTableName);
    return cardMaps.map((e) => CardModel.fromJson(e)).toList();
  }

  Future<CardModel?> getItem(int id) async {
    final cardMap = await database!.query(
      _userTableName,
      where: '$columdId= ?',
      whereArgs: [id],
      columns: [columdId],
    );
    if (cardMap.isNotEmpty) {
      return CardModel.fromJson(cardMap.first);
    } else {
      return null;
    }
  }

  Future deleteItem(int id) async {
    await database!.delete(
      _userTableName,
      where: '$columdId= ?',
      whereArgs: [id],
    );
  }

  Future update(int id, CardModel model) async {
    await database!.update(
      _userTableName,
      model.toJson(),
      where: '$columdId= ?',
      whereArgs: [id],
    );
  }

  Future<void> closeDatabase() async {
    await database!.close();
  }
}
