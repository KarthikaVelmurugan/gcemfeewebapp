import 'package:flutter/material.dart';
abstract class Style {
  static const TextStyle style = TextStyle(
    fontSize: 25.0,
    fontFamily: 'CM Sans Serif',
    fontWeight: FontWeight.w800,
    color: Colors.white,

  );

  static const TextStyle substyle = TextStyle(

    color: Colors.white70,
    fontStyle: FontStyle.italic,
    fontSize: 18.0,
    fontFamily: 'CM Sans Serif',

  );

  static const TextStyle headStyle = TextStyle(
    fontSize: 18.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

//subheading styles
  static const TextStyle subheadStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.w300,
  );
}