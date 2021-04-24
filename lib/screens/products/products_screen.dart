import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/custom_drawer/custom_drawer.dart';
import '../../models/product_manager.dart';
import '../../screens/products/components/product_list_tile.dart';
import '../../screens/products/components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        // leading: Builder(
        //   builder: (context) => Padding(
        //     padding: const EdgeInsets.only(left: 26),
        //     child: IconButton(
        //       icon: const Icon(Icons.menu),
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //     ),
        //   ),
        // ),
        title: Consumer<ProductManager>(
          builder: (_, productManager, __) {
            if (productManager.search.isEmpty) {
              return const Text(
                'Products',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF4A544C),
                ),
              );
            } else {
              return LayoutBuilder(
                builder: (_, constraints) {
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(productManager.search));
                      if (search != null) {
                        productManager.search = search;
                      }
                    },
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: constraints.biggest.width,
                      child: Text(
                        productManager.search,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        centerTitle: true,
        actions: [
          Consumer<ProductManager>(
            builder: (_, productManager, __) {
              if (productManager.search.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16, left: 26),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(productManager.search));
                      if (search != null) {
                        productManager.search = search;
                      }
                    },
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 16, left: 26),
                  child: IconButton(
                    // ignore: prefer_const_constructors
                    icon: Icon(Icons.close),
                    onPressed: () async {
                      productManager.search = '';
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Consumer<ProductManager>(
        builder: (_, productManager, __) {
          final filteredProducts = productManager.filteredProducts;
          return ListView.builder(
            itemCount: filteredProducts.length,
            itemBuilder: (_, index) {
              return ProductListTile(filteredProducts[index]);
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 13),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          foregroundColor: const Color(0xFF2AC58C),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
