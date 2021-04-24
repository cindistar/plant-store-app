import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'item_quantity.dart';
import 'product.dart';

class CartProduct extends ChangeNotifier {
  CartProduct.fromProduct(this.product) {
    productId = product.id;
    quantity = 1;
  }

  CartProduct.fromDocument(DocumentSnapshot document) {
    id = document.id;
    productId = document.data()['pid'] as String;
    quantity = document.data()['quantity'] as int;
    firestore
        .doc('products/$productId')
        .get()
        .then((doc) => product = Product.fromDocument(doc));
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String id;
  String productId;
  int quantity;

  Product product;
  ItemQuantity itemQuantity;

  ItemQuantity get unitPrice {
    if (product == null) return null;
    return product.quantity[0];
  }

  Map<String, dynamic> toCartItemMap() {
    return {
      'pid': productId,
      'quantity': quantity,
    };
  }

  bool stackable(Product product) {
    return product.id == productId;
  }

  void increment() {
    quantity++;
    notifyListeners();
  }

  void decrement() {
    quantity--;
    notifyListeners();
  }

  //Essas são tentativas de funções, mas retornam null e dão erro:
  //
  // bool hasStock (CartProduct cartProduct) {
  //   final stock = itemQuantity.stock;
  //   if (stock == null) return false;
  //   return stock >= cartProduct.quantity;
  // 
  // bool get stocky {
  //   final stock = itemQuantity.hasStock;
  //   if (stock == null) return false;
  //   return itemQuantity.stock >= quantity;
  // }

  bool get hasStock {
    final stock = itemQuantity;
    if (stock == null) return false;
    return stock.hasStock;
  }
}
