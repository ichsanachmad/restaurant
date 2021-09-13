import 'package:equatable/equatable.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';

class GetRestaurantsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetRestaurantsInitState extends GetRestaurantsState {}

class OnLoadingGetRestaurantsState extends GetRestaurantsState {
  @override
  List<Object?> get props => [];
}

class OnSuccessGetRestaurantsState extends GetRestaurantsState {
  final List<Restaurant> restaurants;

  OnSuccessGetRestaurantsState({required this.restaurants});

  @override
  List<Object?> get props => [this.restaurants];
}

class OnSuccessCheckRestaurantLocalIsExistState extends GetRestaurantsState {
  final bool isExist;

  OnSuccessCheckRestaurantLocalIsExistState({required this.isExist});

  @override
  List<Object?> get props => [this.isExist];
}

class OnErrorGetRestaurantsState extends GetRestaurantsState {
  final String message;

  OnErrorGetRestaurantsState({required this.message});

  @override
  List<Object?> get props => [this.message];
}
