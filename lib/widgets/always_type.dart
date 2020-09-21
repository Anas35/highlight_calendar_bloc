import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:calendar_app/lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget alwaysType(BuildContext context) {
    return  CalendarCarousel<EventInterface>(
      markedDateShowIcon: true,
      markedDateIconMargin: 0,
      markedDatesMap: addedEven,
      markedDateMoreShowTotal: null,
      markedDateIconMaxShown: 1,
      markedDateIconBuilder: (events) {
        return events.getIcon();
      },
      onDayPressed: (DateTime dateTime, List<EventInterface> event ){
        removeEvents(context, dateTime);
      },
    );
  }

  void removeEvents(BuildContext context, DateTime dateTime) {
    // ignore: close_sinks
    final calendarBloc = context.bloc<CalendarBloc>();
    calendarBloc.add(RemoveDate(dateTime));
  }
