import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/alarm_scheduling/alarm_scheduling_event.dart';
import 'package:restaurant/bloc/alarm_scheduling/alarm_scheduling_state.dart';
import 'package:restaurant/utils/utils.dart';

class AlarmSchedulingBloc
    extends Bloc<AlarmSchedulingEvent, AlarmSchedulingState> {
  final AlarmPrefs _prefs = AlarmPrefs();
  AlarmSchedulingBloc() : super(AlarmSchedulingState());

  @override
  Stream<AlarmSchedulingState> mapEventToState(
      AlarmSchedulingEvent event) async* {
    if (event == AlarmSchedulingEvent.TURN_ON) {
      yield* _onTurnOnAlarm();
    }

    if (event == AlarmSchedulingEvent.TURN_OFF) {
      yield* _onTurnOffAlarm();
    }

    if (event == AlarmSchedulingEvent.CHECK_STATUS) {
      yield* _checkAlarm();
    }
  }

  Stream<AlarmSchedulingState> _onTurnOnAlarm() async* {
    await _prefs.setAlarmOnOff(true);
    await AndroidAlarmManager.periodic(
      Duration(hours: 24),
      1,
      BackgroundService.callback,
      startAt: DateTimeHelper.format(),
      exact: true,
      wakeup: true,
    );

    yield AlarmSchedulingStatusCallbackState(
        status: (await _prefs.getAlarmOnOff()));
  }

  Stream<AlarmSchedulingState> _onTurnOffAlarm() async* {
    await _prefs.setAlarmOnOff(false);
    await AndroidAlarmManager.cancel(1);

    yield AlarmSchedulingStatusCallbackState(
        status: (await _prefs.getAlarmOnOff()));
  }

  Stream<AlarmSchedulingState> _checkAlarm() async* {
    yield AlarmSchedulingStatusCallbackState(
        status: (await _prefs.getAlarmOnOff()));
  }
}
