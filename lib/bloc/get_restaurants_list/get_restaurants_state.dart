import 'package:equatable/equatable.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';

class GetRestaurantsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnSuccessGetRestaurantsState extends GetRestaurantsState {
  List<Restaurant> restaurants;

  OnSuccessGetRestaurantsState({required this.restaurants});

  @override
  List<Object?> get props => [this.restaurants];
}

class OnErrorGetRestaurantsState extends GetRestaurantsState {
  String message;

  OnErrorGetRestaurantsState({required this.message});

  @override
  List<Object?> get props => [this.message];
}
