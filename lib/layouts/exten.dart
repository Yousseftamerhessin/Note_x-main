import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay addHour(int min) {
    return  this.replacing(hour: this.hour , minute: this.minute+min);
  }
}