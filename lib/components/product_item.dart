import 'package:flutter/material.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/utils/app_routes.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Positioned(
              left: 3,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontFamily: 'Lateef',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Theme.of(context).colorScheme.background,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: Theme.of(context).colorScheme.background,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
