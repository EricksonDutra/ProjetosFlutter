import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/projects/shop_coder/models/order_list.dart';
import 'package:teste/projects/shop_coder/widgets/app_drawer.dart';
import 'package:teste/projects/shop_coder/widgets/order_widget.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, index) => OrderWidget(
          order: orders.items[index],
        ),
      ),
    );
  }
}
