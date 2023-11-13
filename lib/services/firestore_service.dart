import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylibrary/model/card_model.dart';

class FireStoreService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>>? _cardList = [];
  List<Map<String, dynamic>>? get cardList => _cardList;
  set cardList(List<Map<String, dynamic>>? value) {
    _cardList = value;
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

  /* getCard(String id) async {
    await _firestore
        .collection('UserCard')
        .doc(_auth.currentUser!.uid)
        .collection('Cards')
        .doc(id)
        .get();
  } */

  controlFavorite(String id, bool newValue) async {
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

  deleteCard() async {}
}
