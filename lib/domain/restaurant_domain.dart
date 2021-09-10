import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
import 'package:restaurant/data/source/network/network_repository.dart';

class RestaurantDomain {
  final NetworkRepository _networkRepository = NetworkRepository();

  Future<RestaurantResponse> getRestaurants() {
    return _networkRepository.getRestaurants();
  }
}
