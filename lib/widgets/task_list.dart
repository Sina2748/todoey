import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/Models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: context.watch<TaskData>().tasks[index].isDone,
          taskTitle: context.watch<TaskData>().tasks[index].name,
          checkboxCallback: (checkboxState) {
            context.read<TaskData>().updateTask(index);
          },
          gestureCallback: () {
            print('yes $index');
            context.read<TaskData>().deleteTask(index);
          },
        );
      }, // Callback
      itemCount: context.watch<TaskData>().tasks.length,
    );
  }
}
