class Todo {
  String task;
  bool status;

  Todo({
    required this.task,
    required this.status,
  });

  factory Todo.create(String task, bool status) {
    return Todo(task: task, status: status);
  }
}
