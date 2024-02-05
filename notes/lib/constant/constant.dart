import 'package:flutter/material.dart';

class Root {
  static const Color bg = Colors.white;
  static String bgimage = "images/3043831.jpg";
  static double textsize = 20;
  static double headersize = 30;
  static double iconsize = 30;
  static double sigmax = 4;
  static double sigmay = 4;

  static Gradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withOpacity(.25),
      Colors.white.withOpacity(.25),
    ],
  );
}
