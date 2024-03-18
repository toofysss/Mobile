import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root {
  static String lang = "";
  static String langsearch = Get.deviceLocale!.languageCode;

  // Img
  static String imgloc = "images";
  static String logo = "$imgloc/logo.png";
  static String logodark = "$imgloc/dark.png";
  // Size
  static double fontsize = 14;
  static double iconsize = 25;
  // Theme
  static ThemeMode themeMode = ThemeMode.system;
  static String mode = "";
  // lottie
  static String search = "$imgloc/search.json";
}

class ThemeDataClass {
  static Color textLight = Colors.black;
  static Color textDark = Colors.white;
  static Color grey = Colors.grey;
}
