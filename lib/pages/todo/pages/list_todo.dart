import 'package:flutter/material.dart';
import 'package:teste/pages/todo/models/todo.dart';

class ListTodo extends StatefulWidget {
  const ListTodo({super.key});

  @override
  State<ListTodo> createState() => ListTodoState();
}

class ListTodoState extends State<ListTodo> {
  var cbxValue = false;

  List<Todo> todoList = [
    Todo.create('task1', false),
    Todo.create('task2', true),
    Todo.create('task3', false),
    Todo.create('task4', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TextField(
            decoration: InputDecoration(label: Text('escreva uma nova tarefa...')),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton(
                child: const Text('salvar'),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: Checkbox(
                  value: todoList[index].status,
                  onChanged: (value) {
                    setState(() {
                      todoList[index].status = value!;
                    });
                  }),
              title: Text(todoList[index].task),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever_outlined)),
            );
          }),
        ));
  }
}
