import 'dart:async';
import 'package:calendar_app/bloc/bloc.dart';
import 'package:calendar_app/data/data.dart';
import 'package:calendar_app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';


class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {

  final CalendarRepository _calendarRepository;

  CalendarBloc(this._calendarRepository) : super(NewUser());

  final _calendarStateController = StreamController<EventList<Event>>();
  StreamSink<EventList<Event>> get _event => _calendarStateController.sink;

  Stream<EventList<Event>> get event => _calendarStateController.stream;

  final _calendarEventController = StreamController<CalendarEvent>();

  Sink<CalendarEvent> get calendarEventSink => _calendarEventController.sink;

  calendarBloc() {
    _calendarEventController.stream.listen(mapEventToState);
  }

  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event) async* {

    if(event is AddDate){
      _addEventToState(event);
    }
    else if (event is RemoveDate){
      _removeEventInState(event);
    }
    else if (event is NewUserType) {
      yield Loading();
      final getBool = await _calendarRepository.calendarType(event.always, event.occasionally);
        if (getBool == CalendarType.Always) {
          final allDate = _calendarRepository.yearDate();
          for(int i = 0; i < allDate.length; i++){
            final getData = _calendarRepository.getDate(allDate[i]);
            addedEven.add(getData.dateTime, Event(title: getData.event,date: getData.dateTime, icon: getData.icon));
            }
          yield AlwaysType();
        }
        else if (getBool == CalendarType.Occasionally) {
          yield OccasionallyType();
        }
        else {
          yield Error();
          yield NewUser();
        }
    }
    else {
      yield NewUser();
    }

    _event.add(addedEven);
  }

  Stream<CalendarBloc> _addEventToState(AddDate event) {

    final getData = _calendarRepository.getDate(event.dateTime);
    addedEven.add(getData.dateTime, Event(title: getData.event, icon: getData.icon, date: getData.dateTime));

    return null;
  }

  Stream<CalendarBloc> _removeEventInState(RemoveDate event) {

    final getData = _calendarRepository.getDate(event.dateTime);
    addedEven.removeAll(getData.dateTime);

    return null;
  }

  void dispose() {
    _calendarEventController.close();
    _calendarStateController.close();
  }
}