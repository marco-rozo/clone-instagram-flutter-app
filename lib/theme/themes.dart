import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Colors.black,
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.black),
      // buttonColor: Colors.red,
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    primaryColor: Colors.white,
    // buttonColor: Colors.red,
  );
}
