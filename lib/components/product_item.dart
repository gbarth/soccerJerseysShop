import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
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
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product,
                );
              },
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do you want to remove this product?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              ).then(
                (value) async {
                  if (value ?? false) {
                    try {
                      await Provider.of<ProductList>(
                        context,
                        listen: false,
                      ).removeProduct(product);
                    } on HttpException catch (e) {
                      msg.showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
