import 'package:equatable/equatable.dart';
import 'package:restaurant/data/model/restaurant/restaurant_model.dart';

class InsertRestaurantLocalEvent extends Equatable {
  final Restaurant restaurant;

  InsertRestaurantLocalEvent({required this.restaurant});

  @override
  List<Object?> get props => [this.restaurant];
}
