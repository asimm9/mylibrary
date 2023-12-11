import 'package:cloud_firestore/cloud_firestore.dart';
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

  Stream<QuerySnapshot<Map<String, dynamic>>> _cardStream = Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get cardStream => _cardStream;
  set cardStream(Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    _cardStream = value;
    notifyListeners();
  }

  final Stream<QuerySnapshot<Map<String, dynamic>>> _filterCardStream =
      const Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get filterCardStream =>
      _filterCardStream;
  set filterCardStream(Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    filterCardStream = value;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> _favoriteCardStream =
      Stream.empty();
  Stream<QuerySnapshot<Map<String, dynamic>>> get favoriteCardStream =>
      _favoriteCardStream;
  set favoriteCardStream(Stream<QuerySnapshot<Map<String, dynamic>>> value) {
    _favoriteCardStream = value;
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
    cardStream = _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .where('itemName', isEqualTo: searchedValue)
        .snapshots();
  }

  searchFavoriteCardList(String searchedValue) {
    favoriteCardStream = _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .where('isFavorite', isEqualTo: true)
        .where('itemName', isEqualTo: searchedValue)
        .snapshots();
  }
}
