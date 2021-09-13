import 'package:equatable/equatable.dart';

class DeleteRestaurantLocalEvent extends Equatable {
  final String id;

  DeleteRestaurantLocalEvent({required this.id});

  @override
  List<Object?> get props => [this.id];
}
