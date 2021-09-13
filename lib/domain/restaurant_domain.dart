import 'dart:convert';

import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
import 'package:restaurant/data/source/local/database_helper.dart';
import 'package:restaurant/data/source/network/network_repository.dart';

class RestaurantDomain {
  final NetworkRepository _networkRepository = NetworkRepository();
  final DatabaseHelper _localRepository = DatabaseHelper();

  Future<RestaurantResponse> getRestaurants() {
    return _networkRepository.getRestaurants();
  }

  Future<List<Restaurant>> getAllRestaurantsLocal() async {
    var res = await _localRepository.getRestaurantsLocal();
    List<Restaurant> list = [];

    res.forEach((e) {
      list.add(
          Restaurant.fromRestaurantEntityJson(jsonDecode(e.restaurantJson)));
    });

    return list;
  }

  void insertRestaurant(Restaurant restaurant) async {
    await _localRepository.insertRestaurant(restaurant.toRestaurantEntity());
  }

  void deleteRestaurant(String id) async {
    await _localRepository.deleteRestaurant(id);
  }

  Future<bool> isRestaurantExist(String id) async {
    return _localRepository.isRestaurantExist(id);
  }
}
