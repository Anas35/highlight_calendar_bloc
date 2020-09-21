
abstract class CalendarState {

  const CalendarState();

}

class NewUser extends CalendarState {}

class Loading extends CalendarState {}

class AlwaysType extends CalendarState {}

class OccasionallyType extends CalendarState {}

class Error extends CalendarState{}