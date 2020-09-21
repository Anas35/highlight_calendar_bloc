import 'package:calendar_app/lib.dart';

abstract class CalendarRepository {

  CalendarData getDate(DateTime dateTime);
  Future<CalendarType> calendarType(bool always, occasionally);
  List<DateTime> yearDate();

}

class CalendarFunctionality implements CalendarRepository {

  @override
  CalendarData getDate(DateTime dateTime) {
    return CalendarData(
      dateTime: dateTime,
      event: '',
      icon: addIcon(dateTime.day)
    );
  }

  @override
  Future<CalendarType> calendarType(bool always, occasionally) {
    if (always == true) {
      return Future.delayed(
        Duration(seconds: 1), (){
          return CalendarType.Always;
      }
      );
    }
    else if (occasionally == true){
      return Future.delayed(
          Duration(seconds: 2), (){
        return CalendarType.Occasionally;
      }
      );
    }
    else {
      return Future.delayed(
          Duration(seconds: 2), (){
        return CalendarType.None;
       }
      );
    }
  }

  @override
  List<DateTime> yearDate() {

    List<DateTime> date = [];

    for(int i = 1; i <= 12; i++){
      var now = DateTime(2020, i);

      var totalDays = daysInMonth(now);

      for(int j = 0; j < totalDays; j++){
       date.add(DateTime(2020, i, j + 1));
      }
    }
    return date;
  }

    int daysInMonth(DateTime date){
      var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
      var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
      return firstDayNextMonth.difference(firstDayThisMonth).inDays;
    }

}
