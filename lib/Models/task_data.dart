import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'خرید شیر'),
    Task(name: 'حل کردن مشق ها'),
    // Task(name: 'buy milk2000'),
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
}
