class Task {
  final String name;
  bool isDone;
  int? taskId;
  int taskIndex;
  Task(
      {this.taskId,
      required this.name,
      required this.isDone,
      required this.taskIndex});

  void toggleDone() {
    isDone = !isDone;
  }
}
