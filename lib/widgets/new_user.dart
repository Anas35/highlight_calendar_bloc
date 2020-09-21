import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:calendar_app/bloc/bloc.dart';


  bool always = false;
  bool occ = false;


Widget newUser(BuildContext context, setState) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
            Text('Calendar HighLight',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 48,
               fontWeight: FontWeight.bold,
              color: Colors.blueAccent
              ),
            ),
            SizedBox(height: 50,),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
             title: Text('Always'),
             value: always,
             onChanged: (bool value) {
              setState(() {
                occ == true ? occ = false: always = true;
                always = value;
              });
            },
          ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Occasionally'),
              value: occ,
              onChanged: (bool value) {
                setState(() {
                  always == true ? always = false: occ = true;
                  occ = value;
                });
              },
            ),
            SizedBox(height: 30,),
            ButtonTheme(
              minWidth: 200,
              height: 50,
              child: RaisedButton(
                  child: Text('Next',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 18
                   ),
                  ),
                  onPressed: (){
                    selectedCalendarType(context);
                    }
                  ),
            ),
          ],
      );
  }

selectedCalendarType(BuildContext context) {
  // ignore: close_sinks
  final getType = context.bloc<CalendarBloc>();
  getType.add(NewUserType(always: always, occasionally: occ));
}