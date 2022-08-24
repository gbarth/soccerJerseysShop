import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/auth.dart';
import '../models/product.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final auth = Provider.of<Auth>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GridTile(
            child: GestureDetector(
              child: FadeInImage(
                placeholder:
                    const AssetImage('assets/images/product-placeholder.png'),
                image: NetworkImage(product.imageUrl),
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
            footer: Container(
              height: 25,
              child: const GridTileBar(
                backgroundColor: Colors.black87,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<Product>(
                builder: (ctx, product, _) => IconButton(
                  onPressed: () {
                    product.toogleFavorite(
                      auth.token ?? '',
                      auth.userId ?? '',
                    );
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 9,
                  top: 5,
                ),
                child: Text(
                  product.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
