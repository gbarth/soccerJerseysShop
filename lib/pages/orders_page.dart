import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order_widget.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  Future<void> _refreshOrders(BuildContext context) {
    return Provider.of<OrderList>(context, listen: false).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontFamily: 'Lateef',
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return RefreshIndicator(
              onRefresh: () => _refreshOrders(context),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Consumer<OrderList>(
                  builder: (context, orders, child) => ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: (context, i) =>
                        OrderWidget(order: orders.items[i]),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
