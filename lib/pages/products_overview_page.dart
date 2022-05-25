import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/badge.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';

import '../components/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FutStore',
          style: TextStyle(
            fontFamily: 'Lateef',
            fontSize: 32,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Favorites Only'),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text('All items'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorite) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
              ),
            ),
            builder: (context, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          )
        ],
      ),
      body: ProductGrid(),
      drawer: Drawer(),
    );
  }
}
