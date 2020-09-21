

abstract class CalendarEvent {

  const CalendarEvent();

}

class AddDate extends CalendarEvent {

  final DateTime dateTime;

  AddDate(this.dateTime);

}

class RemoveDate extends CalendarEvent {

  final DateTime dateTime;

  RemoveDate(this.dateTime);

}

class NewUserType extends CalendarEvent {

  bool always;
  bool occasionally;

  NewUserType({this.always, this.occasionally});

}
