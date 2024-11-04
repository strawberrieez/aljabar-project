import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<QuerySnapshot<Map<String, dynamic>>> getColl({String category = 'semua'}) async {
  if (category == 'semua') {
    return FirebaseFirestore.instance.collection('Menu').get();
  } else {
    return FirebaseFirestore.instance.collection('Menu').where('kategori', isEqualTo: category).get();
  }
}

Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String id) async {
  final result = await FirebaseFirestore.instance.collection('Menu').doc(id).get();
  // productDetail = Product.fromMap(result.data() ?? {});

  // return productDetail!;
  return result;
}

Future<void> addToFavorites(String menuId) async {
  final test = await FirebaseFirestore.instance.collection('Favorites').add({'menuId': menuId});
  debugPrint(test.toString());
}
