import 'package:flutter/cupertino.dart';
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
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff188958),
          onPrimary: Colors.white,
          secondary: Color(0xffc8e0de),
          onSecondary: Color(0xff169779),
          error: Color(0xffff0000),
          onError: Color(0xffffc7c7),
          background: Color(0xffE1E2E1),
          onBackground: Color(0xff1d1d3b),
          surface: Color(0xfff9fffe),
          onSurface: Color(0xffd20d61),
        ),

        useMaterial3: true,

        ///other
        // textButtonTheme: TextButtonThemeData(style: null),
      ),
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)),
      // darkTheme: ThemeData.dark(),
      home: TasksScreen(),
    );
  }
}
