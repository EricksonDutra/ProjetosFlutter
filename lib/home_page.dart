import 'package:flutter/material.dart';
import 'package:teste/projects/conversor_temperatura.dart';
import 'package:teste/projects/racha_conta.dart';
import 'package:teste/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Racha conta'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (bc) => const RachaConta(),
                ),
              ),
            ),
            ListTile(
              title: const Text('Conversor de temperatura'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (bc) => const ConversorTemperatura(),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: drawerWidget(context),
    );
  }
}
