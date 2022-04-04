import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTitle;
  final void Function(bool?)? checkboxCallback;
  final void Function()? gestureCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.gestureCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: GestureDetector(
          onLongPress: gestureCallback,
          child: Text(
            taskTitle!,
            style: TextStyle(
                fontSize: 20,
                decoration: isChecked! ? TextDecoration.lineThrough : null),
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkboxCallback,
        ));
  }
}
