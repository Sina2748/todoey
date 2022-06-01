import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todoey/utils/constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'package:todoey/screens/pomodoro_screen.dart';

void startBackgroundService(timerNumber) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setInt("timerNumber", timerNumber);

  await initializeService();

  // final service = FlutterBackgroundService();
  // service.startService();
}

void stopBackgroundService() async {
  final service = FlutterBackgroundService();

  service.invoke("stopService");
}

Future<void> initializeService() async {
  print('initializeService');

  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: true,

      // this will executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );
  service.startService();
}

// to ensure this executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch
bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  print('FLUTTER BACKGROUND FETCH');

  return true;
}

void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  print('onStart:');
  DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually

  SharedPreferences preferences = await SharedPreferences.getInstance();
  // await preferences.setString("hello", "world");

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  //
  // service.on('setAsGo').listen((event) {
  //   int timerSetDuration = 7;
  //   print('>>>>>>>>>>>>>>>>>>> $timerSetDuration ');
  // });

  // int aa = Duration(minutes: 6).inSeconds;
  // bring to foreground
  int timerNumber = preferences.getInt("timerNumber")!;

  Duration duration = Duration();
  int seconds = Duration(minutes: timerNumber).inSeconds;

  Timer.periodic(
    const Duration(seconds: 1),
    (timer) async {
      seconds = seconds - 1;

      if (seconds < 0) {
        playSoundHere();
        stopBackgroundService();
        if (service is AndroidServiceInstance) {
          service.setForegroundNotificationInfo(
            title: "پومودورو",
            content: "زمان به پایان رسید!",
          );
        }
      } else {
        duration = Duration(seconds: seconds);
      }

      String leftTime =
          '${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}';

      if (service is AndroidServiceInstance) {
        service.setForegroundNotificationInfo(
          title: "پومودورو",
          content: " زمان باقی مانده: $leftTime",
        );
      }

      /// you can see this log in logcat
      print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

      // test using external plugin
      final deviceInfo = DeviceInfoPlugin();
      String? device;
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        device = androidInfo.model;
      }

      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        device = iosInfo.model;
      }

      service.invoke(
        'update',
        {
          "current_date": DateTime.now().toIso8601String(),
          "device": device,
        },
      );
    },
  );
}

// Duration duration = Duration();
// int seconds = Duration(minutes: 6).inSeconds;
//
// String showLeftTime() {
//   seconds = seconds - 1;
//   if (seconds < 0) {
//     playSoundHere();
//     stopBackgroundService();
//   } else {
//     duration = Duration(seconds: seconds);
//   }
//   print(timerNumber);
//   print('>>>>>>>>>>>>>>>>> showLeftTime');
//   return ('${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}');
// }
