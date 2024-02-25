import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root {
  static String lang = "";
  static String langData = Get.deviceLocale!.languageCode;

  // Img
  static String imgloc = "asset";
  static String jsonData = "$imgloc/Data";
  static String appBarlogo = "$imgloc/OIP.jpg";
  // Size
  static double fontsize = 16;
  static double headersize = Get.width / 19;
  static double iconsize = 25;
  // Theme
  static ThemeMode themeMode = ThemeMode.system;
  static String mode = "";
}

class ThemeDataClass {
  static Color textLight = Colors.white;
  static Color textDark = Colors.white;
}
