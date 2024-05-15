import 'package:flutter/material.dart';
import 'package:teste/pages/manipula_tela.dart';
import 'package:teste/projects/conversor_temperatura.dart';
import 'package:teste/projects/racha_conta.dart';
import 'package:teste/projects/sqflite/lista_compras/screens/lista_compras.dart';

Widget drawerWidget(context) {
  return Drawer(
    child: Column(
      children: [
        const SizedBox(
          width: double.infinity,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: Column(
              children: [
                CircleAvatar(radius: 40),
                SizedBox(height: 20),
                Text('data'),
              ],
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'Conversor de temperatura',
          ),
          leading: const Icon(Icons.cloud),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (bc) => const ConversorTemperatura(),
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'Racha conta',
          ),
          leading: const Icon(Icons.payment),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (bc) => const RachaConta(),
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'TabBarView',
          ),
          leading: const Icon(Icons.fit_screen),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (bc) => const ManipulaTeladrawerWidget(),
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'ListaCompras',
          ),
          leading: const Icon(Icons.list),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (bc) => const ListaCompras(),
            ),
          ),
        ),
      ],
    ),
  );
}
