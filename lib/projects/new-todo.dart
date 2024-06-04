import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Task> tasks = [
    Task(title: 'Task1'),
    Task(title: 'Task2'),
  ];

  void toggleCheckboxState(int index, bool? checkboxState) {
    setState(() {
      tasks[index].status = checkboxState ?? false;
    });
  }

  void showModal(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add New Task',
                style: GoogleFonts.oswald(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: taskController,
                decoration: const InputDecoration(
                  labelText: 'Task Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Add Task'),
                onPressed: () {
                  String newTaskTitle = taskController.text;
                  if (newTaskTitle.isNotEmpty) {
                    setState(() {
                      tasks.add(Task(title: newTaskTitle));
                    });
                    Navigator.pop(context); // Close the modal
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic),
          titleMedium: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic),
          titleSmall: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index].title),
                    trailing: TaskCheckbox(
                      isChecked: tasks[index].status,
                      checkboxState: (bool? value) {
                        toggleCheckboxState(index, value);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => showModal(context),
          );
        }),
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({super.key, required this.checkboxState, required this.isChecked});

  final bool isChecked;
  final Function(bool?) checkboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      onChanged: checkboxState,
      value: isChecked,
    );
  }
}

class Task {
  Task({required this.title, this.status = false});

  String title;
  bool status;
}
