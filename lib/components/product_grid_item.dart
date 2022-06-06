import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/product.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GridTile(
            child: GestureDetector(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_DETAIL,
                  arguments: product,
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 9,
                ),
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontFamily: 'Lateef',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Consumer<Product>(
                builder: (ctx, product, _) => IconButton(
                  onPressed: () {
                    product.toogleFavorite();
                  },
                  icon: Icon(
                    product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                ),
                alignment: Alignment.centerLeft,
                onPressed: () {
                  cart.addItem(product);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Product added!'),
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'DISMISS',
                        textColor: Colors.redAccent,
                        onPressed: () {
                          cart.removeSIngleItem(product.id);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
