import 'dart:isolate';
import 'dart:ui';
import 'dart:math';

import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
import 'package:restaurant/domain/restaurant_domain.dart';
import 'package:restaurant/main.dart';
import 'package:restaurant/utils/helper/notification_helper.dart';

final ReceivePort port = ReceivePort();
final _random = Random();

class BackgroundService {
  static BackgroundService? _instance;
  static String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print("AlarmFire");
    final NotificationHelper _notificationHelper = NotificationHelper();
    final RestaurantDomain _domain = RestaurantDomain();
    try {
      var results = await _domain.getRestaurants();
      var rand = 0 + _random.nextInt((results.restaurants?.length ?? 0) - 0);
      var restaurant = results.restaurants?[rand] ?? Restaurant();
      await _notificationHelper.showNotification(
          flutterLocalNotificationsPlugin, restaurant);
    } catch (e) {
      await _notificationHelper.showNotification(
          flutterLocalNotificationsPlugin, Restaurant());
    }

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
