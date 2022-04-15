import 'dart:collection';
import 'package:todoey/components/supabase_manager.dart';
import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:todoey/utils/constants.dart';

SupabaseManager subabaseManager = SupabaseManager();

class TaskData extends ChangeNotifier {
  // List<Task> _tasks = getTasksFromCloud('2dbfd106-63e8-4759-a992-7c2316d5edeb');
  List<Task> _tasks = [];
  List taskIndexList = [];

  UnmodifiableListView<Task> get tasks {
    // _tasks = await getTasksFromCloud('2dbfd106-63e8-4759-a992-7c2316d5edeb');
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  addTask(String newTaskTitle, String user_is, bool isDone) async {
    final task = Task(
      name: newTaskTitle,
      isDone: isDone,
      taskIndex: _tasks.length + 1,
    );
    _tasks.add(task);
    subabaseManager.addData(newTaskTitle, user_is, false, task.taskIndex);
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
    final Task item = _tasks.removeAt(oldIndex);
    _tasks.insert(newIndex, item);
    _tasks[newIndex].taskIndex = newIndex;

    // subabaseManager.updateTaskIndex(item.taskId, newIndex);
    if (oldIndex < newIndex) {
      for (int i = oldIndex; i < newIndex - oldIndex; i++) {
        _tasks[i].taskIndex = i;
        // _tasks.sort((x, y) => x.taskIndex.compareTo(y.taskIndex));
        print(taskIndexList);
      }
    }

    if (oldIndex > newIndex) {
      print('>>>>>>>>>>>>>>${oldIndex >= oldIndex - newIndex}');
      for (int i = oldIndex - 1; i < oldIndex - newIndex && i >= 0; i--) {
        _tasks[i].taskIndex = i;
        // _tasks.sort((x, y) => x.taskIndex.compareTo(y.taskIndex));
        print(taskIndexList);
        print('fgfgfgfgfgggggfg --- $i');
      }
    }

    for (int i = 0; i < _tasks.length; i++) {
      print('Name: ${_tasks[i].name} - Index: ${_tasks[i].taskIndex}');
      subabaseManager.updateTaskIndex(_tasks[i].taskId, _tasks[i].taskIndex);
    }
  }

  // print('AAA: ${_tasks[0].name}');
  // // _tasks.sort((x, y) => x.taskIndex.compareTo(y.taskIndex));
  // print('AAA: ${_tasks[0].name}');
  //
  // print('new position: ${_tasks[newIndex].taskIndex}');
  // // var a;
  // // var b;
  // // Map indexUpdateCell;
  // // Map<String, int>? indexUpdate;
  // // var taskId;
  // for (int i = 0; i < _tasks.length; i++) {
  //   int a = _tasks[i].taskIndex;
  //   // indexUpdateCell = {'task_idex': a};
  //   int? b = _tasks[i].taskId;
  //   // taskId = {'taskId': b};
  //
  //   // indexUpdate.map(indexUpdateCell);
  //   print('taskId: $b, taskIndex:$a');
  //   subabaseManager.updateTaskIndex(b, a);
  // }
  // }

  getTasksFromCloud(String user_id) async {
    final List<Task> _tasks = [];
    var userCloudTasks = await subabaseManager.readData(user_id);

    for (int i = 0; i < userCloudTasks.length; i++) {
      var taskId = userCloudTasks[i]['taskId'];
      var name = userCloudTasks[i]['task_column'];
      var isDone = userCloudTasks[i]['isDone_column'];
      int addingTaskIndex = userCloudTasks[i]['task_index'];

      var adding = Task(
          taskId: taskId,
          name: name,
          isDone: isDone,
          taskIndex: addingTaskIndex);
      _tasks.add(adding);
      taskIndexList.add(addingTaskIndex);
    } // for end

    notifyListeners();
    // print(_tasks);
    print('taskIndexList: $taskIndexList');
    return _tasks;
  }

  addCloudTasksToList(String user_id) async {
    _tasks = await getTasksFromCloud(user_id);
    print('addCloudTasksToList');
    notifyListeners();
  }
}
