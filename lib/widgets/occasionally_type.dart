import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calendar_app/lib.dart';

Widget occasionallyType(BuildContext context) {
  return CalendarCarousel<EventInterface>(
    markedDateShowIcon: true,
    markedDateIconMargin: 0,
    markedDatesMap: addedEven,
    markedDateMoreShowTotal: null,
    markedDateIconMaxShown: 1,
    markedDateIconBuilder: (events) {
      return events.getIcon();
    },
    onDayPressed: (DateTime dateTime, List<EventInterface> event ){
      addEvents(context, dateTime);
    },
  );
}

void addEvents(BuildContext context, DateTime dateTime) {
  // ignore: close_sinks
  final calendarBloc = context.bloc<CalendarBloc>();
  calendarBloc.add(AddDate(dateTime));
}