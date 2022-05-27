import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item_widget.dart';
import 'package:shop/models/order_list.dart';

import '../models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.primary,
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    label: Text(
                      'R\$ ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderList>(
                        context,
                        listen: false,
                      ).addOrder(cart);

                      cart.clear();
                    },
                    child: Text(
                      'FINISH',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemsCount,
              itemBuilder: (context, i) => CartItemWidget(cartItem: items[i]),
            ),
          )
        ],
      ),
    );
  }
}
