import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/Models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'buy milk0'),
    Task(name: 'buy milk1'),
    Task(name: 'buy milk2'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: tasks[index].isDone,
            taskTitle: tasks[index].name,
            checkboxCallback: (bool? checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      }, // Callback
      itemCount: tasks.length,
    );
  }
}
