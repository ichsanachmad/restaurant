import 'dart:convert';

import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
import 'package:restaurant/data/source/network/api_routes.dart';
import 'package:restaurant/data/source/network/helper/api_helper_impl.dart';

class NetworkRepository {
  final ApiHelperImpl _apiHelperImpl = ApiHelperImpl();

  Future<RestaurantResponse> getRestaurants() async {
    var response = await _apiHelperImpl.get(ApiRoutes.GET_RESTAURANTS);
    return RestaurantResponse.fromJson(jsonDecode(response.data));
  }
}
