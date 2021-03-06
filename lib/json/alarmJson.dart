import 'package:animated_clock/model/alarm.dart';

List<AlarmData> alarmData = [
  AlarmData(DateTime.now().add(Duration(hours: 1)), description: "First Alarm"),
  AlarmData(DateTime.now().add(Duration(hours: 2)), description: "Office"),
  AlarmData(DateTime.now().add(Duration(seconds: 3400)), description: "Sports"),
];
