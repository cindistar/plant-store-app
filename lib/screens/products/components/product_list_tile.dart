import 'package:flutter/material.dart';
import '../../../models/product.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFF827D7D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 25),
                            // ignore: prefer_const_constructors
                            child: Text(
                              '\$ 25.00',
                              // ignore: unnecessary_const
                              style: const TextStyle(
                                color: Color(0xFF2F9F76),
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
              child: Hero(
                tag: product.images.first,
                child: Image.network(
                  product.images.first,
                  cacheHeight: 120,
                  cacheWidth: 100,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
