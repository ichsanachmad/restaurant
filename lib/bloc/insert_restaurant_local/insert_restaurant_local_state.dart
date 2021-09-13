import 'package:equatable/equatable.dart';

class InsertRestaurantLocalState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InsertRestaurantLocalInitState extends InsertRestaurantLocalState {}

class OnLoadingInsertRestaurantLocalState extends InsertRestaurantLocalState {
  @override
  List<Object?> get props => [];
}

class OnSuccessInsertRestaurantLocalState extends InsertRestaurantLocalState {
  final String message;

  OnSuccessInsertRestaurantLocalState({required this.message});

  @override
  List<Object?> get props => [this.message];
}

class OnErrorInsertRestaurantLocalState extends InsertRestaurantLocalState {
  final String message;

  OnErrorInsertRestaurantLocalState({required this.message});

  @override
  List<Object?> get props => [this.message];
}
