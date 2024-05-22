import 'package:flutter/material.dart';
import 'package:teste/pages/todo/pages/list_todo.dart';

class ListaTarefaPage extends StatefulWidget {
  const ListaTarefaPage({super.key});

  @override
  State<ListaTarefaPage> createState() => _ListaTarefaPageState();
}

class _ListaTarefaPageState extends State<ListaTarefaPage> with SingleTickerProviderStateMixin {
  late TabController tabViewController;

  @override
  void initState() {
    super.initState();
    tabViewController = TabController(length: 3, vsync: this);
  }

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
          foregroundColor: Colors.white,
          bottom: TabBar(controller: tabViewController, tabs: const [
            Tab(
              child: Text(
                'todas',
              ),
            ),
            Tab(
              child: Text(
                'a fazer',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                'concluidas',
                style: TextStyle(color: Colors.white),
              ),
            )
          ]),
        ),
        body: TabBarView(controller: tabViewController, children: [
          const ListTodo(),
          Container(
            color: Colors.greenAccent,
          ),
          Container(),
        ]),
      ),
    );
  }
}
