class Task {
  final String name;
  bool isDone;
  int? taskId;
  Task({this.taskId, required this.name, required this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }
}
