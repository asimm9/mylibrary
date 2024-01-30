import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';

class FireStoreService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _currentValue = false;
  bool get currentValue => _currentValue;
  set currentValue(bool value) {
    _currentValue = value;
    notifyListeners();
  }

  bool _lastValue = false;
  bool get lastValue => _lastValue;
  set lastValue(bool value) {
    _lastValue = value;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _cardStream =
      const Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get cardStream => _cardStream;
  set cardStream(Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    _cardStream = value;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _filterCardStream =
      const Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get filterCardStream =>
      _filterCardStream;
  set filterCardStream(Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    _filterCardStream = value;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _itemRateCardStream =
      const Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get itemRateCardStream =>
      _itemRateCardStream;
  set itemRateCardStream(Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    _itemRateCardStream = value;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _searchFavoriteCardStream =
      const Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get searchFavoriteCardStream =>
      _searchFavoriteCardStream;
  set searchFavoriteCardStream(
      Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    _searchFavoriteCardStream = value;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _filterFavoriteCardStream =
      const Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get filterFavoriteCardStream =>
      _filterFavoriteCardStream;
  set filterFavoriteCardStream(
      Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    _filterFavoriteCardStream = value;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _itemRateFavoriteCardStream =
      const Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get itemRateFavoriteCardStream =>
      _itemRateFavoriteCardStream;
  set itemRateFavoriteCardStream(
      Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    _itemRateFavoriteCardStream = value;
    notifyListeners();
  }

  saveCard(CardModel cardModel) async {
    Map<String, dynamic> cardMap = cardModel.toJson();
    await _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .doc(cardModel.id)
        .set(cardMap);
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCards() {
    return _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .snapshots();
  }

  controlFavorite(String id, bool newValue) async {
    lastValue = newValue;

    await _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .doc(id)
        .update({'isFavorite': newValue});
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFavoriteList() {
    return _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .where('isFavorite', isEqualTo: true)
        .snapshots();
  }

  getCurrentBoolValue(CardModel cardModel) {
    _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .doc(cardModel.id)
        .get()
        .then((value) {
      currentValue = value.data()!['isFavorite'];
    });
  }

  deleteCard(CardModel cardModel) async {
    _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .doc(cardModel.id)
        .delete();
  }

  searchCardList(String searchedValue) {
    cardStream =
        filterCard().where('itemName', isEqualTo: searchedValue).snapshots();
  }

  filterCardList(List itemTypeLit) async {
    if (itemTypeLit.isNotEmpty) {
      filterCardStream =
          filterCard().where('itemType', whereIn: itemTypeLit).snapshots();
    } else {
      print(
          'Uyarı: Boş bir liste, whereIn filtresi için sorgu çalıştırılmadı.');
    }
  }

  itemRateCardList(List itemRateList) async {
    if (itemRateList.isNotEmpty) {
      itemRateCardStream =
          filterCard().where('itemRate', whereIn: itemRateList).snapshots();
    } else {
      print(
          'Uyarı: Boş bir liste, whereIn filtresi için sorgu çalıştırılmadı.');
    }
  }

  searchFavoriteCardList(String searchedValue) {
    searchFavoriteCardStream = filterCard()
        .where('isFavorite', isEqualTo: true)
        .where('itemName', isEqualTo: searchedValue)
        .snapshots();
  }

  filterFavoriteCardList(List itemTypeLit) {
    if (itemTypeLit.isNotEmpty) {
      filterFavoriteCardStream = filterCard()
          .where('isFavorite', isEqualTo: true)
          .where('itemType', whereIn: itemTypeLit)
          .snapshots();
    } else {
      print(
          'Uyarı: Boş bir liste, whereIn filtresi için sorgu çalıştırılmadı.');
    }
  }

  itemRateFavoriteCardList(List itemRateList) async {
    if (itemRateList.isNotEmpty) {
      itemRateFavoriteCardStream = filterCard()
          .where('isFavorite', isEqualTo: true)
          .where('itemRate', whereIn: itemRateList)
          .snapshots();
    } else {
      print(
          'Uyarı: Boş bir liste, whereIn filtresi için sorgu çalıştırılmadı.');
    }
  }

  String formatTimeStamp(Timestamp timestamp) {
    DateFormat format = DateFormat('d-MM-y  HH:mm');
    return format.format(timestamp.toDate());
  }
}

CollectionReference<Map<String, dynamic>> filterCard() {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  return _firestore
      .collection('UserCard')
      .doc(_auth.currentUser!.uid)
      .collection('Cards');
}
