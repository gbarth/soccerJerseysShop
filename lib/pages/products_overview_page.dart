import 'package:flutter/material.dart';

import '../components/product_grid.dart';

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FutStore',
          style: TextStyle(
            fontFamily: 'Lateef',
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: ProductGrid(),
      drawer: Drawer(),
    );
  }
}