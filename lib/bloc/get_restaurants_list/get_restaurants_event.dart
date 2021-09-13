import 'package:equatable/equatable.dart';

class GetRestaurantsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnRequestGetRestaurantsEvent extends GetRestaurantsEvent {
  @override
  List<Object?> get props => [];
}

class OnSearchRestaurantsEvent extends GetRestaurantsEvent {
  final String query;

  OnSearchRestaurantsEvent({required this.query});

  @override
  List<Object?> get props => [this.query];
}

class OnGetRestaurantsLocalEvent extends GetRestaurantsEvent {
  @override
  List<Object?> get props => [];
}

class OnCheckRestaurantLocalIsExistEvent extends GetRestaurantsEvent {
   final String id;

  OnCheckRestaurantLocalIsExistEvent({required this.id});

  @override
  List<Object?> get props => [this.id];
}