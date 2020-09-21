import 'package:flutter/material.dart';

Widget addIcon(int date) => Container(
  decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.all(Radius.circular(1000))),
  child: Center(child: Text(date.toString())),
);