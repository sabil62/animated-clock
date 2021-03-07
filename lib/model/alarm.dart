import 'package:flutter/material.dart';

class AlarmData {
  DateTime alarmDateTime;
  String description;
  bool isActive;
  List<Color> gradients;
  AlarmData(this.alarmDateTime,
      {this.description, this.isActive, this.gradients});
}
