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
