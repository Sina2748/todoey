import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/Models/task_data.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';
import 'MyApp.dart';

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

// to initialize flutter_background_service
import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

SupabaseManager subabaseManager = SupabaseManager();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // to initialize flutter_background_service

  // to initialize the notificationservice. notifications
  NotificationService().initNotification();

  await Supabase.initialize(
    url: 'https://akqgwjakzlijndpqptxi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFrcWd3amFremxpam5kcHFwdHhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NDk0MjExNjIsImV4cCI6MTk2NDk5NzE2Mn0.28KySaUFeXuIUPjVqKp6JOC4mevviutD5OjZRRacbo4',
  );

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
