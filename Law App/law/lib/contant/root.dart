import 'package:flutter/material.dart';

class Root {
  static String loc = "image";
  static String jsonData = "$loc/Data";

  static String logo = "$loc/logo.jpg";
  static String font = "$loc/alfont_com_Amiri-Regular.ttf";
  static String loading = "$loc/55zxFLpjVK.json";
  static String nonotes = "$loc/55zxFLpjVK.json";
  static String loadimg = "$loc/loading.png";

  static String lang = "";
  static Color backgroundApp = const Color(0xffEDEFFB);
  static Color primary = const Color(0xff365973);
  static Color secondry = Colors.white;
  static double textsize = 20;
  static double headersize = 23;
  static double iconsSize = 18;

  // Theme
  static ThemeMode themeMode = ThemeMode.system;
  static String mode = "";
}

class ThemeDataClass {
  static Color textLight = Colors.black;
  static Color textDark = Colors.white;
  static Color grey = Colors.grey;
}
