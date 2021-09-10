import 'package:flutter/material.dart';
import 'package:restaurant/ui/ui.dart';

class AppNavigator {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder _builder;
    switch (settings.name) {
      case SplashScreen.ROUTE:
        _builder = (context) => SplashScreen();
        break;
      case HomeScreen.ROUTE:
        _builder = (context) => HomeScreen();
        break;
      case DetailRestaurant.ROUTE:
        _builder = (context) => DetailRestaurant();
        break;
      default:
        throw 'Illegal Routes ${settings.name}';
    }
    return MaterialPageRoute(builder: _builder, settings: settings);
  }
}
