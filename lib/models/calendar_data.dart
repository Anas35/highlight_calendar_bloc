import 'package:flutter/material.dart';

class CalendarData {

  final DateTime dateTime;
  final String event;
  final Widget icon;

  CalendarData({this.dateTime, this.event, this.icon});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarData &&
          runtimeType == other.runtimeType &&
          dateTime == other.dateTime &&
          event == other.event &&
          icon == other.icon;

  @override
  int get hashCode => dateTime.hashCode ^ event.hashCode ^ icon.hashCode;
}