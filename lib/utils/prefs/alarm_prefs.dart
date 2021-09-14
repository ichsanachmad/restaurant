import 'package:shared_preferences/shared_preferences.dart';

class AlarmPrefs {
  static const ALARM_ON_OFF_PREF_KEY = 'alarm_on_off_pref_key';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setAlarmOnOff(bool value) async {
    (await _prefs).setBool(ALARM_ON_OFF_PREF_KEY, value);
  }

  Future<bool> getAlarmOnOff() async {
    return (await _prefs).getBool(ALARM_ON_OFF_PREF_KEY) ?? false;
  }
}
