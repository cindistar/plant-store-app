import 'package:flutter/material.dart';
import 'package:plant_store_app/models/cart_product.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {this.iconData, this.color, this.onTap, this.size, this.cartProduct});

  final IconData iconData;
  final Color color;
  final VoidCallback onTap;
  final Size size;

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProduct>(
      builder: (_, cartProduct, __) {
        return Material(
          color:
              cartProduct.quantity > 1 ? const Color(0xFF2AC58C) : Colors.red,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                iconData,
                color: color,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
