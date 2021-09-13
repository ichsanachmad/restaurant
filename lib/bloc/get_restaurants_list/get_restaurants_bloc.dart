import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/get_restaurants_list/get_restaurants_event.dart';
import 'package:restaurant/bloc/get_restaurants_list/get_restaurants_state.dart';
import 'package:restaurant/domain/restaurant_domain.dart';

class GetRestaurantsBloc
    extends Bloc<GetRestaurantsEvent, GetRestaurantsState> {
  GetRestaurantsBloc() : super(GetRestaurantsInitState());

  final RestaurantDomain _restaurantDomain = RestaurantDomain();

  @override
  Stream<GetRestaurantsState> mapEventToState(
      GetRestaurantsEvent event) async* {
    if (event is OnRequestGetRestaurantsEvent) {
      yield* _onGetRestaurants();
    }

    if (event is OnSearchRestaurantsEvent) {
      yield* _onSearchRestaurants(query: event.query);
    }

    if (event is OnGetRestaurantsLocalEvent) {
      yield* _onGetRestaurantsLocal();
    }

    if (event is OnCheckRestaurantLocalIsExistEvent) {
      yield* _onCheckLocal(event.id);
    }
  }

  Stream<GetRestaurantsState> _onGetRestaurants() async* {
    yield OnLoadingGetRestaurantsState();
    try {
      var res = await _restaurantDomain.getRestaurants();
      yield OnSuccessGetRestaurantsState(restaurants: res.restaurants ?? []);
    } catch (e) {
      yield OnErrorGetRestaurantsState(message: 'Error Fetch');
    }
  }

  Stream<GetRestaurantsState> _onSearchRestaurants(
      {required String query}) async* {
    yield OnLoadingGetRestaurantsState();
    try {
      var res = await _restaurantDomain.getRestaurants();
      var filteredResult = (res.restaurants ?? [])
          .where((e) => _equalsIgnoreCase(query, e.name ?? ""))
          .toList();

      yield OnSuccessGetRestaurantsState(restaurants: filteredResult);
    } catch (e) {
      yield OnErrorGetRestaurantsState(message: 'Error Fetch');
    }
  }

  Stream<GetRestaurantsState> _onGetRestaurantsLocal() async* {
    yield OnLoadingGetRestaurantsState();
    try {
      var res = await _restaurantDomain.getAllRestaurantsLocal();
      yield OnSuccessGetRestaurantsState(restaurants: res);
    } catch (e) {
      yield OnErrorGetRestaurantsState(message: 'Error Fetch');
    }
  }

  Stream<GetRestaurantsState> _onCheckLocal(String id) async* {
    yield OnLoadingGetRestaurantsState();
    try {
      var res = await _restaurantDomain.isRestaurantExist(id);
      yield OnSuccessCheckRestaurantLocalIsExistState(isExist: res);
    } catch (e) {
      yield OnErrorGetRestaurantsState(message: 'Error Fetch');
    }
  }

  bool _equalsIgnoreCase(String a, String b) {
    return a.toLowerCase() == b.toLowerCase() ||
        b.toLowerCase().contains(a.toLowerCase());
  }
}
