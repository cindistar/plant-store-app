import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../models/cart_manager.dart';
import '../../models/product.dart';
import '../../models/user_manager.dart';
import '../product/components/custom_leaf_circle.dart';
import '../product/components/text_widget.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen(
    this.product,
  );

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return ChangeNotifierProvider.value(
      value: product,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  child: Stack(
                    children: [
                      Positioned(
                        left: -80,
                        right: -70,
                        top: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            height: 600,
                            width: 700,
                            child: Transform.rotate(
                              angle: -0.01,
                              child: Container(
                                width: 491.57,
                                height: 347.84,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffffffff),
                                      blurRadius: 20,
                                      offset: Offset(-10, -10),
                                    ),
                                    BoxShadow(
                                      color: Color(0x7fd4d4d4),
                                      blurRadius: 10,
                                      offset: Offset(10, 10),
                                    ),
                                  ],
                                  color: Color(0xfff0fbf1),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //
                      Padding(
                        padding: const EdgeInsets.only(top: 300),
                        child: //
                            Transform.rotate(
                          angle: -0.00,
                          child: Container(
                            width: 432,
                            height: 503,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(55),
                                topRight: Radius.circular(55),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  blurRadius: 20,
                                  offset: Offset(-10, -10),
                                ),
                                BoxShadow(
                                  color: Color.fromRGBO(197, 184, 184, 0.8),
                                  blurRadius: 10,
                                  offset: Offset(10, 10),
                                ),
                              ],
                              color: Color(0xfff5f5f5),
                            ),
                          ),
                        ),
                      ),
                      Container(),
                      Positioned(
                        left: -30,
                        child: Hero(
                          tag: product.images.first,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              product.images.first,
                              cacheHeight: 350,
                              cacheWidth: 250,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 280,
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 300,
                          width: 400,
                          child: TextWidget(
                            details: product.details[0],
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 255,
                        right: 72,
                        child: CustomLeafCircle(
                          iconData: FontAwesomeIcons.leaf,
                          color: Color(0xFF2AC58C),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 51, top: 375),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4A544C),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                '\$ 150',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2AC58C),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF827D7D),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                product.description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF827D7D),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Consumer2<UserManager, Product>(
                              builder: (_, userManager, product, __) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 50, 20, 20),
                                  child: Container(
                                      width: 280,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: primaryColor,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        boxShadow: [
                                          const BoxShadow(
                                            color: Color(0xFFC5B8B8),
                                            offset: Offset(5, 5),
                                            blurRadius: 10,
                                          ),
                                          const BoxShadow(
                                            color: Color(0xFFFFFFFF),
                                            offset: Offset(-5, -5),
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: product.hasStock
                                            ? () {
                                                if (userManager.isLoggedIn) {
                                                  context
                                                      .read<CartManager>()
                                                      .addToCart(product);
                                                  Navigator.of(context)
                                                      .pushNamed('/cart');
                                                } else {
                                                  Navigator.of(context)
                                                      .pushNamed('/login');
                                                }
                                              }
                                            : null,
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          primary: const Color(0xFF85E227),
                                          onSurface: const Color(0xFF85E227),
                                          elevation: 0,
                                        ),
                                        child: Text(
                                          userManager.isLoggedIn
                                              ? 'Add To Cart'
                                              : 'Login',
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
