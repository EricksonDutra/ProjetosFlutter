import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/projects/shop_coder/models/cart.dart';
import 'package:teste/projects/shop_coder/models/item_cart.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget(
    this.cartItem, {
    super.key,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => Provider.of<Cart>(context, listen: false).removeItem(cartItem.productId),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 15,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text(cartItem.title[0].toUpperCase()),
              ),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Preço unitário: R\$ ${cartItem.price}'),
              Text('Total: R\$ ${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}'),
            ],
          ),
          trailing: Text('${cartItem.quantity}x'),
        ),
      ),
    );
  }
}
