import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste/projects/shop_coder/models/order.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.order});

  final Order order;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text('R\$  ${widget.order.total.toStringAsFixed(2)}'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.expand_more),
        onPressed: () {},
      ),
    ));
  }
}
