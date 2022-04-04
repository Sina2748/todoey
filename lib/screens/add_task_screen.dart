import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addNewTaskcallback;
  AddTaskScreen(this.addNewTaskcallback);

  @override
  Widget build(BuildContext context) {
    String? newTask;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(
          left: 40,
          right: 40,
          top: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              onChanged: (e) {
                newTask = e;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                // addNewTaskcallback(newTask);
                context.read<TaskData>().addTask(newTask!);
                Navigator.pop(context);
              },
              child: Text(
                'add',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
