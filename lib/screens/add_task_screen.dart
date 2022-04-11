import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addNewTaskcallback;
  AddTaskScreen(this.addNewTaskcallback);

  @override
  Widget build(BuildContext context) {
    String? newTask;

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Container(
        padding: EdgeInsets.only(
          left: 40,
          right: 40,
          top: 20,
        ),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'چه کار دیگری باید انجام شود؟',
              textAlign: TextAlign.center,
              style: GoogleFonts.lemonada(
                  textStyle: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.w600,
              )),
            ),
            TextField(
              onChanged: (e) {
                newTask = e;
              },
              textAlign: TextAlign.center,
              autofocus: true,
            ),
            FlatButton(
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                // addNewTaskcallback(newTask);
                context.read<TaskData>().addTask(
                    newTask!, '2dbfd106-63e8-4759-a992-7c2316d5edeb', false);
                Navigator.pop(context);
              },
              child: Text(
                'اضافه کن',
                style: GoogleFonts.lemonada(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
