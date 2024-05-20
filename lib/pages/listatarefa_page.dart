import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListaTarefaPage extends StatefulWidget {
  const ListaTarefaPage({super.key});

  @override
  State<ListaTarefaPage> createState() => _ListaTarefaPageState();
}

class _ListaTarefaPageState extends State<ListaTarefaPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'To Do App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 85, 138, 230),
          shadowColor: Colors.white,
          bottom: const TabBar(tabs: [
            Tab(
              child: Text('todas'),
            ),
            Tab(
              child: Text('a fazer'),
            ),
            Tab(
              child: Text('concluidas'),
            )
          ]),
        ),
        body: TabBarView(children: [
          Container(),
          Container(),
          Container(),
        ]),
      ),
    );
  }
}
