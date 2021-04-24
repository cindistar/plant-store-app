import 'package:flutter/material.dart';
import 'package:plant_store_app/common/custom_icon_button.dart';
import 'package:provider/provider.dart';
import '../../../models/cart_product.dart';

class CartTile extends StatelessWidget {
  const CartTile(this.cartProduct);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return ChangeNotifierProvider.value(
      value: cartProduct,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.fromLTRB(26, 20, 26, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: primaryColor,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                    color: Color(0x7fd4d4d4),
                    offset: Offset(10, 10),
                    blurRadius: 10,
                  ),
                  const BoxShadow(
                    color: Color(0xFFFFFFFF),
                    offset: Offset(-10, -10),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 120,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          cartProduct.product.name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF827D7D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // ignore: sized_box_for_whitespace
                          Consumer<CartProduct>(
                            builder: (_, cartProduct, __) {
                              if (cartProduct.hasStock) {
                                // ignore: sized_box_for_whitespace
                                return Container(
                                  height: 50,
                                  width: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      '\$ ${cartProduct.unitPrice.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: Color(0xFF2F9F76),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                // ignore: sized_box_for_whitespace
                                return Container(
                                  height: 50,
                                  width: 75,
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'se',
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          Consumer<CartProduct>(
                            builder: (_, cartProduct, __) {
                              return const Padding(
                                padding: EdgeInsets.fromLTRB(5, 22, 20, 5),
                                child: Text(
                                  'x',
                                  style: TextStyle(
                                    color: Color(0xFFAF7BF0),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                          Consumer<CartProduct>(
                            builder: (_, cartProduct, __) {
                              return Container(
                                padding: const EdgeInsets.only(top: 20),
                                height: 50,
                                width: 100,
                                child: Text(
                                  '${cartProduct.quantity}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Color(0xFFAF7BF0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 350,
            top: 30,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CustomIconButton(
                    iconData: Icons.add,
                    color: Colors.white,
                    onTap: cartProduct.increment,
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CustomIconButton(
                    iconData: Icons.remove,
                    color: Colors.white,
                    onTap: cartProduct.decrement,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 27,
            //top: 20,
            bottom: 5,
            //right: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                cartProduct.product.images.first,
                cacheHeight: 120,
                cacheWidth: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
