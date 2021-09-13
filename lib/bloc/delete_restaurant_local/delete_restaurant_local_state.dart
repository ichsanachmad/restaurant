import 'package:equatable/equatable.dart';

class DeleteRestaurantLocalState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeleteRestaurantLocalInitState extends DeleteRestaurantLocalState {}

class OnLoadingDeleteRestaurantLocalState extends DeleteRestaurantLocalState {
  @override
  List<Object?> get props => [];
}

class OnSuccessDeleteRestaurantLocalState extends DeleteRestaurantLocalState {
  final String message;

  OnSuccessDeleteRestaurantLocalState({required this.message});

  @override
  List<Object?> get props => [this.message];
}

class OnErrorDeleteRestaurantLocalState extends DeleteRestaurantLocalState {
  final String message;

  OnErrorDeleteRestaurantLocalState({required this.message});

  @override
  List<Object?> get props => [this.message];
}
