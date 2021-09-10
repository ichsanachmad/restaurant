import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/get_restaurants_list/get_restaurants_event.dart';
import 'package:restaurant/bloc/get_restaurants_list/get_restaurants_state.dart';
import 'package:restaurant/domain/restaurant_domain.dart';

class GetRestaurantsBloc
    extends Bloc<GetRestaurantsEvent, GetRestaurantsState> {
  GetRestaurantsBloc() : super(GetRestaurantsState());

  final RestaurantDomain _restaurantDomain = RestaurantDomain();

  @override
  Stream<GetRestaurantsState> mapEventToState(
      GetRestaurantsEvent event) async* {
    if (event is OnRequestGetRestaurantsEvent) {
      yield* _onGetRestaurants();
    }
  }

  Stream<GetRestaurantsState> _onGetRestaurants() async* {
    try {
      var res = await _restaurantDomain.getRestaurants();
      yield OnSuccessGetRestaurantsState(restaurants: res.restaurants ?? []);
    } catch (e) {
      yield OnErrorGetRestaurantsState(message: 'Error Fetch');
    }
  }
}
