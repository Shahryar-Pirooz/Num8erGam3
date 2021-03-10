import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyColors{
  static const MaterialColor blue = MaterialColor(_bluePrimaryValue, <int, Color>{
    50: Color(0xFFE6F0F6),
    100: Color(0xFFC2DAEA),
    200: Color(0xFF99C1DC),
    300: Color(0xFF70A8CD),
    400: Color(0xFF5195C3),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF2D7AB1),
    700: Color(0xFF266FA8),
    800: Color(0xFF1F65A0),
    900: Color(0xFF135291),
  });
  static const int _bluePrimaryValue = 0xFF3282B8;

  static const MaterialColor blueAccent = MaterialColor(_blueAccentValue, <int, Color>{
    100: Color(0xFFC4E0FF),
    200: Color(_blueAccentValue),
    400: Color(0xFF5EA9FF),
    700: Color(0xFF459BFF),
  });
  static const int _blueAccentValue = 0xFF91C4FF;

  static const MaterialColor black = MaterialColor(_blackPrimaryValue, <int, Color>{
    50: Color(0xFFE4E5E6),
    100: Color(0xFFBBBEC0),
    200: Color(0xFF8D9396),
    300: Color(0xFF5F676B),
    400: Color(0xFF3D474C),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF182227),
    700: Color(0xFF141C21),
    800: Color(0xFF10171B),
    900: Color(0xFF080D10),
  });
  static const int _blackPrimaryValue = 0xFF1B262C;

  static const MaterialColor blackAccent = MaterialColor(_blackAccentValue, <int, Color>{
    100: Color(0xFF54BBFF),
    200: Color(_blackAccentValue),
    400: Color(0xFF008EED),
    700: Color(0xFF007FD4),
  });
  static const int _blackAccentValue = 0xFF21A6FF;

  static const MaterialColor secondary = MaterialColor(_secondaryPrimaryValue, <int, Color>{
    50: Color(0xFFF6E9E6),
    100: Color(0xFFEAC9C2),
    200: Color(0xFFDCA599),
    300: Color(0xFFCD8070),
    400: Color(0xFFC36551),
    500: Color(_secondaryPrimaryValue),
    600: Color(0xFFB1432D),
    700: Color(0xFFA83A26),
    800: Color(0xFFA0321F),
    900: Color(0xFF912213),
  });
  static const int _secondaryPrimaryValue = 0xFFB84A32;

  static const MaterialColor secondaryAccent = MaterialColor(_secondaryAccentValue, <int, Color>{
    100: Color(0xFFFFCAC4),
    200: Color(_secondaryAccentValue),
    400: Color(0xFFFF6E5E),
    700: Color(0xFFFF5745),
  });
  static const int _secondaryAccentValue = 0xFFFF9C91;
}