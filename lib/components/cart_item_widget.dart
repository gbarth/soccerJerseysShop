import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Theme.of(context).colorScheme.onSurface,
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
      ),
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Image.asset(cartItem.imageP),
            ),
          ),
          title: Text(
            cartItem.name,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Total: R\$ ${cartItem.price * cartItem.quantity}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          trailing: Text(
            '${cartItem.quantity}x',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
