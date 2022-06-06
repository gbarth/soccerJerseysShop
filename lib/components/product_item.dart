import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: FittedBox(
          child: Image.network(product.imageUrl),
        ),
      ),
      title: Text(
        product.name,
        style: const TextStyle(
          color: Colors.white,
          //fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
