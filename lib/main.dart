import 'package:calendar_app/bloc/calendar/calendar.dart';
import 'package:calendar_app/data/calendar_repository.dart';
import 'package:calendar_app/screen/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => CalendarBloc(CalendarFunctionality()),
        child: CalendarPage(),
      ),
    );
  }
}

