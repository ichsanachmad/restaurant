import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/delete_restaurant_local/delete_restaurant_local_event.dart';
import 'package:restaurant/bloc/delete_restaurant_local/delete_restaurant_local_state.dart';
import 'package:restaurant/domain/restaurant_domain.dart';

class DeleteRestaurantLocalBloc
    extends Bloc<DeleteRestaurantLocalEvent, DeleteRestaurantLocalState> {
  DeleteRestaurantLocalBloc() : super(DeleteRestaurantLocalInitState());

  final RestaurantDomain _restaurantDomain = RestaurantDomain();

  @override
  Stream<DeleteRestaurantLocalState> mapEventToState(
      DeleteRestaurantLocalEvent event) async* {
    if (event is DeleteRestaurantLocalEvent) {
      yield* _onDeleteRestaurantLocal(event.id);
    }
  }

  Stream<DeleteRestaurantLocalState> _onDeleteRestaurantLocal(
      String id) async* {
    yield OnLoadingDeleteRestaurantLocalState();
    try {
      _restaurantDomain.deleteRestaurant(id);
      yield OnSuccessDeleteRestaurantLocalState(message: 'Success');
    } catch (e) {
      yield OnErrorDeleteRestaurantLocalState(message: 'Error Fetch');
    }
  }
}
