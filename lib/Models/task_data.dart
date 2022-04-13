import 'dart:collection';
import 'package:todoey/components/supabase_manager.dart';
import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:todoey/utils/constants.dart';

SupabaseManager subabaseManager = SupabaseManager();

class TaskData extends ChangeNotifier {
  // List<Task> _tasks = getTasksFromCloud('2dbfd106-63e8-4759-a992-7c2316d5edeb');
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    // _tasks = await getTasksFromCloud('2dbfd106-63e8-4759-a992-7c2316d5edeb');
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  addTask(String newTaskTitle, String user_is, bool isDone) async {
    final task = Task(name: newTaskTitle, isDone: isDone);
    _tasks.add(task);
    subabaseManager.addData(newTaskTitle, user_is, false);
    notifyListeners();
  }

  updateTask(int index) {
    tasks[index].toggleDone();
    var isDone = tasks[index].isDone;
    var taskId = tasks[index].taskId;
    subabaseManager.updateData(taskId, isDone);
    print('index: $index, taskId : $taskId, isDone: $isDone,');
    notifyListeners();
  }

  deleteTask(int index) {
    // _tasks.removeAt(index);
    var taskId = tasks[index].taskId;
    subabaseManager.deleteData(taskId);
    _tasks.removeAt(index);
    notifyListeners();
  }

  reorderTaskList(int oldIndex, int newIndex) {
    (oldIndex < newIndex);

    final Task item = _tasks.removeAt(oldIndex);
    _tasks.insert(newIndex, item);
  }

  getTasksFromCloud(String user_id) async {
    final List<Task> _tasks = [];
    var userCloudTasks = await subabaseManager.readData(user_id);

    for (int i = 0; i < userCloudTasks.length; i++) {
      var taskId = userCloudTasks[i]['taskId'];
      var name = userCloudTasks[i]['task_column'];
      var isDone = userCloudTasks[i]['isDone_column'];
      var adding = Task(taskId: taskId, name: name, isDone: isDone);
      _tasks.add(adding);
    } // for end

    notifyListeners();
    print(_tasks);
    return _tasks;
  }

  addCloudTasksToList(String user_id) async {
    _tasks = await getTasksFromCloud(user_id);
    print('addCloudTasksToList');
    notifyListeners();
  }
}
