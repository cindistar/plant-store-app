import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plant_store_app/models/user.dart';
import 'package:plant_store_app/models/user_manager.dart';

import 'cart_product.dart';
import 'product.dart';

class CartManager extends ChangeNotifier {
  List<CartProduct> items = [];

  Usuario user;

  void updateUser(UserManager userManager) {
    user = userManager.user;
    items.clear();

    if (user != null) {
      _loadCartItems();
    }
  }

  Future<void> _loadCartItems() async {
    final QuerySnapshot cartSnap = await user.cartReference.get();

    items = cartSnap.docs
        .map((d) => CartProduct.fromDocument(d)..addListener(_onItemUpdated))
        .toList();
  }

  void addToCart(Product product) {
    try {
      final e = items.firstWhere((p) => p.stackable(product));
      e.increment();
    } catch (e) {
      final cartProduct = CartProduct.fromProduct(product);
      cartProduct.addListener(_onItemUpdated);
      items.add(cartProduct);
      user.cartReference
          .add(cartProduct.toCartItemMap())
          .then((doc) => cartProduct.id = doc.id);
          notifyListeners();
    }
    
  }

  void removeOfCart(CartProduct cartProduct) {
    items.removeWhere((p) => p.id == cartProduct.id);
    user.cartReference.doc(cartProduct.id).delete();
    cartProduct.removeListener(_onItemUpdated);
    notifyListeners();
  }

  void _onItemUpdated() {
    for (final cartProduct in items) {
      if (cartProduct.quantity == 0) {
        removeOfCart(cartProduct);
      }

      _updateCartProduct(cartProduct);
    }
  }

  void _updateCartProduct(CartProduct cartProduct) {
    user.cartReference.doc(cartProduct.id).update(cartProduct.toCartItemMap());
  }
}
