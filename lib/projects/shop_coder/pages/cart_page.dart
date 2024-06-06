import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teste/projects/shop_coder/models/cart.dart';
import 'package:teste/projects/shop_coder/models/order_list.dart';
import 'package:teste/projects/shop_coder/widgets/cart_item_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final items = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      'R\$ ${cart.totalAmount}',
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Theme.of(context).primaryTextTheme.titleLarge?.color)),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Provider.of<OrderList>(context, listen: false).addOrder(cart);
                        cart.clear();
                      },
                      child: Text('Comprar', style: GoogleFonts.lato())),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, index) => CartItemWidget(
                items[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
