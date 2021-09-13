import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/insert_restaurant_local/insert_restaurant_local_event.dart';
import 'package:restaurant/bloc/insert_restaurant_local/insert_restaurant_local_state.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';
import 'package:restaurant/domain/restaurant_domain.dart';

class InsertRestaurantLocalBloc
    extends Bloc<InsertRestaurantLocalEvent, InsertRestaurantLocalState> {
  InsertRestaurantLocalBloc() : super(InsertRestaurantLocalInitState());

  final RestaurantDomain _restaurantDomain = RestaurantDomain();

  @override
  Stream<InsertRestaurantLocalState> mapEventToState(
      InsertRestaurantLocalEvent event) async* {
    if (event is InsertRestaurantLocalEvent) {
      yield* _onInsertRestaurantLocal(event.restaurant);
    }
  }

  Stream<InsertRestaurantLocalState> _onInsertRestaurantLocal(Restaurant restaurant) async* {
    yield OnLoadingInsertRestaurantLocalState();
    try {
      _restaurantDomain.insertRestaurant(restaurant);
      yield OnSuccessInsertRestaurantLocalState(message:'Success');
    } catch (e) {
      yield OnErrorInsertRestaurantLocalState(message: 'Error Fetch');
    }
  }
}
