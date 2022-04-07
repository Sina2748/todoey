import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/Models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:todoey/widgets/soundplayer.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    print(
      context.watch<TaskData>().tasks,
    );

    return ReorderableListView(
      children: <Widget>[
        for (int index = 0;
            index < context.watch<TaskData>().tasks.length;
            index += 1)
          Card(
            key: Key('$index'),
            child: ListTile(
              title: TaskTile(
                isChecked: context.watch<TaskData>().tasks[index].isDone,
                taskTitle: context.watch<TaskData>().tasks[index].name,
                checkboxCallback: (checkboxState) {
                  context.read<TaskData>().updateTask(index);
                  if (context.read<TaskData>().tasks[index].isDone == true) {
                    // print('play sound!');
                    playSound(noteNumber);
                  }
                },
                gestureCallback: () {
                  context.read<TaskData>().deleteTask(index);
                },
              ),
            ),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          context.read<TaskData>().reorderTaskList(oldIndex, newIndex);
          // final Task item = context.watch<TaskData>().tasks.removeAt(oldIndex);
          // print('newIndex: $newIndex, item: $item');
          // context.read<TaskData>().tasks.insert(newIndex, item);
        });
      },
    );
  }
}

///
//       itemBuilder: (context, index) {
//         return Card(
//           shadowColor: Colors.grey[50],
//           color: Theme.of(context).colorScheme.surface,
//           elevation: 3,
//           child: TaskTile(
//             isChecked: context.watch<TaskData>().tasks[index].isDone,
//             taskTitle: context.watch<TaskData>().tasks[index].name,
//             checkboxCallback: (checkboxState) {
//               context.read<TaskData>().updateTask(index);
//               if (context.read<TaskData>().tasks[index].isDone == true) {
//                 // print('play sound!');
//                 playSound(noteNumber);
//               }
//             },
//             gestureCallback: () {
//               context.read<TaskData>().deleteTask(index);
//             },
//           ),
//         );
//       }, // Callback
//       itemCount: context.watch<TaskData>().tasks.length,
//     );
//   }
// }
