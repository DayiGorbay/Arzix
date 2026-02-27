import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'IranYekan',

    appBarTheme: const AppBarTheme(
      toolbarTextStyle: TextStyle(
        fontFamily: 'IranYekan',
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 78, 78, 78),
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w300,
      ),
    ),
  );

}