import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  focusColor: const Color.fromRGBO(117, 47, 253, 0.2),
  primaryColor: const Color.fromRGBO(117, 47, 253, 1),
  highlightColor: const Color.fromRGBO(147, 102, 200, 1),
  scaffoldBackgroundColor: Colors.white,
  listTileTheme: const ListTileThemeData(
    selectedTileColor: Color.fromRGBO(117, 47, 253, 0.2),
  ),
  fontFamily: 'Nunito',
  sliderTheme: SliderThemeData(valueIndicatorTextStyle: TextStyle(fontSize: 16, fontFamily: 'Nunito')),
  textTheme: const TextTheme(
    
    bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
  ),
);
