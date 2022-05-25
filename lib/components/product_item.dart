import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    );

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            GridTile(
              child: GestureDetector(
                child: Image.asset(
                  product.imagePath,
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ],
        ));
  }
}
