import 'package:equatable/equatable.dart';

class AlarmSchedulingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AlarmSchedulingStatusCallbackState extends AlarmSchedulingState {
  final bool status;

  AlarmSchedulingStatusCallbackState({required this.status});

  @override
  List<Object?> get props => [this.status];
}
