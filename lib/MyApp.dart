import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/Models/task_data.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoey/pages/account_page.dart';
import 'package:todoey/pages/login_page.dart';
import 'package:todoey/pages/splash_page.dart';
import 'components/supabase_manager.dart';
import 'screens/life_balance.dart';
import 'screens/pomodoro_screen.dart';

import 'screens/teachingscreens/pomodoro_teaching_screen.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // '/': (_) => const TasksScreen(),
        '/': (_) => const AccountPage(),

        // '/': (_) => const SplashPage(),
        // '/login': (_) => const LoginPage(),
        // '/account': (_) => const AccountPage(),
        '/taskscreen': (_) => const TasksScreen(),
        '/lifebalancescreen': (_) => const lifeBalanceScreen(),
        '/pomodoroscreen': (_) => const PomodoroScreen(),
        // learn
        '/pomodoroteachingscreen': (_) => const PomodoroTeachingScreen(),
      },
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff12454c),
          onPrimary: Colors.white,
          secondary: Color(0xffc8e0de),
          onSecondary: Color(0xff29a387),
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
      // home: TasksScreen(),
    );
  }
}
