import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'details.dart';
import 'item_quantity.dart';

class Product extends ChangeNotifier {
  Product.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document['name'] as String;
    description = document['description'] as String;
    category = document['category'] as String;
    images = List<String>.from(document.data()['images'] as List<dynamic>);
    quantity = (document.data()['quantity'] as List<dynamic> ?? [])
        .map((q) => ItemQuantity.fromMap(q as Map<String, dynamic>))
        .toList();

    details = (document.data()['details'] as List<dynamic> ?? [])
        .map((d) => Details.fromMap(d as Map<String, dynamic>))
        .toList();
    //debugPrint(quantity);
  }

  String id;
  String name;
  String description;
  String category;
  List<String> images;
  List<ItemQuantity> quantity;
  List<Details> details;


  int get totalStock {
    int stock = 0;
    for (final quant in quantity) {
      stock += quant.stock;
    }
    return stock;
  }

  bool get hasStock {
    return totalStock > 0;
  }

}
