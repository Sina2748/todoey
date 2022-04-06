import 'package:flutter/material.dart';
import 'package:todoey/Models/task_data.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)),
      // darkTheme: ThemeData.dark(),
      home: TasksScreen(),
    );
  }
}
