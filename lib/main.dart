import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant/ui/ui.dart';
import 'package:restaurant/utils/utils.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _service = BackgroundService();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  _service.initializeIsolate();

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  port.listen((e) {
    print(e);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppNavigator _appNavigator = AppNavigator();
    return MaterialApp(
      title: 'Restaurant Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      key: navigatorKey,
      initialRoute: SplashScreen.ROUTE,
      onGenerateRoute: _appNavigator.onGenerateRoute,
    );
  }
}
