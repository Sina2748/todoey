import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:google_fonts/google_fonts.dart';

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
      trailing: Checkbox(
        activeColor: Theme.of(context).colorScheme.primary,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      title: GestureDetector(
        onDoubleTap: gestureCallback,
        child: Text(
          taskTitle!,
          textAlign: TextAlign.center,
          style: GoogleFonts.harmattan(
            textStyle: TextStyle(
                fontSize: 18,
                decoration: isChecked! ? TextDecoration.lineThrough : null),
          ),
        ),
      ),
    );
  }
}
