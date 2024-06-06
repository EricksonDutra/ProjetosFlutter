import 'package:flutter/material.dart';
import 'package:teste/utils/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeshop);
            },
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Pedidos'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AppRoutes.orders);
              })
        ],
      ),
    );
  }
}
