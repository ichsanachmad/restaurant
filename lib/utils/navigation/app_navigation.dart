import 'package:flutter/material.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
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
      case DetailRestaurantScreen.ROUTE:
        Restaurant restaurant = settings.arguments as Restaurant;
        _builder = (context) => DetailRestaurantScreen(restaurant: restaurant);
        break;
      case SearchScreen.ROUTE:
        _builder = (context) => SearchScreen();
        break;
      default:
        throw 'Illegal Routes ${settings.name}';
    }
    return MaterialPageRoute(builder: _builder, settings: settings);
  }
}
