import 'package:calendar_app/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<CalendarBloc,CalendarState>(
            listener: (context, state) {
              if (state is Error) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red[900],
                    content: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('Select one option',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),),
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is NewUser) {
                return newUser(context,setState);
              }
              else if (state is Loading) {
                return isLoading();
              }
              else if (state is AlwaysType) {
                return alwaysType(context);
              }
              else if (state is OccasionallyType) {
                return occasionallyType(context);
              }
              else {
                return newUser(context, setState);
              }
            }
        ),
      ),
    );
  }
}
