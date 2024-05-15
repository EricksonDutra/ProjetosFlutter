import 'package:flutter/material.dart';
import 'package:teste/pages/screenone_page.dart';
import 'package:teste/pages/screenthree_page.dart';
import 'package:teste/pages/screentwo_page.dart';

class ManipulaTeladrawerWidget extends StatefulWidget {
  const ManipulaTeladrawerWidget({super.key});

  @override
  State<ManipulaTeladrawerWidget> createState() => _ManipulaTeladrawerWidgetState();
}

class _ManipulaTeladrawerWidgetState extends State<ManipulaTeladrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manipulando abas'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.call),
              child: Text('CHAMADAS'),
            ),
            Tab(
              icon: Icon(Icons.message),
              child: Text('CHATS'),
            ),
            Tab(
              icon: Icon(Icons.chat),
              child: Text('CONVERSAS'),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          ScreenOne(),
          ScreenTwo(),
          ScreenThree(),
        ]),
      ),
    );
  }
}
