import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'با زدن دکمه + به کارهات اضافه کن'),
    Task(name: 'با زدن ▢ کارها تغییر حالت می دن'),
    Task(name: 'با دو بار زدن روی هر کار اون رو حذف کن'),
    Task(name: 'با نگه‌داشتن روی هر کدوم از کارها اون کار رو جا‌بجا کن'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);

    notifyListeners();
  }

  updateTask(int index) {
    tasks[index].toggleDone();

    notifyListeners();
  }

  deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  reorderTaskList(int oldIndex, int newIndex) {
    (oldIndex < newIndex);

    final Task item = _tasks.removeAt(oldIndex);
    _tasks.insert(newIndex, item);
  }
}
