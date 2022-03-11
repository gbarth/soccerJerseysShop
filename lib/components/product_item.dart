import 'package:flutter/material.dart';

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
      child: GridTile(
        child: Image.asset(
          product.imagePath,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        footer: GridTileBar(
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.favorite),
          // ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          // trailing: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.shopping_cart),
          // ),
        ),
      ),
    );
  }
}
