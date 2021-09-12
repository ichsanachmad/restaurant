import 'package:flutter/material.dart';
import 'package:restaurant/ui/ui.dart';
import 'package:restaurant/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppNavigator _appNavigator = AppNavigator();
    return MaterialApp(
      title: 'Restaurant Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: SplashScreen.ROUTE,
      onGenerateRoute: _appNavigator.onGenerateRoute,
    );
  }
}
