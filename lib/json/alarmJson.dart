import 'package:animated_clock/constants/theme_data.dart';
import 'package:animated_clock/model/alarm.dart';

List<AlarmData> alarmData = [
  AlarmData(DateTime.now().add(Duration(hours: 1)),
      description: "First Alarm", gradients: GradientColors.sky),
  AlarmData(DateTime.now().add(Duration(hours: 2)),
      description: "Office", gradients: GradientColors.sunset),
  AlarmData(DateTime.now().add(Duration(seconds: 3400)),
      description: "Sports", gradients: GradientColors.fire),
];
