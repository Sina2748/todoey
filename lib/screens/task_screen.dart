import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'add_task_screen.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/Models/task.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradiantAppBar(pageTitle: 'لیست انجام کارها'),
      // backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).colorScheme.surface,
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((newTaskTitle) {
                  // });
                }),
              ),
            ),
          );
        },
        // backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: kBackgroundImage,
              // alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),

              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
