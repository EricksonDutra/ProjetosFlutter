import 'package:flutter/material.dart';
import 'package:teste/pages/manipula_tela.dart';
import 'package:teste/projects/conversor_temperatura.dart';
import 'package:teste/projects/helpdesk/initial_page.dart';
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
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZXAya2JzZ3l6MnAxbTFtZHVzN3RuZWduOHhpM2NpeHZyOWp2dDQ1aSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/tXL4FHPSnVJ0A/giphy.gif',
                  ),
                ),
                SizedBox(height: 20),
                Text('Our apps...ops...'),
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
        ListTile(
          title: const Text(
            'HelpDesk',
          ),
          leading: const Icon(Icons.help_outline),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (bc) => const InitialPage(),
            ),
          ),
        ),
      ],
    ),
  );
}
