import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/cart_manager.dart';
import 'components/cart_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 120),
          child: Text(
            'Cart',
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF4A544C),
            ),
          ),
        ),
      ),
      body: Consumer<CartManager>(
        builder: (_, cartManager, __) {
          return ListView(
            children: [
              Column(
                children: cartManager.items
                    .map((cartProduct) => CartTile(cartProduct))
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
