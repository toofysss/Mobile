import 'package:flutter/material.dart';

class Root {
  static String imageloc = "images";
  static String logo = "$imageloc/logo.png";
  static String loading = "$imageloc/JId29j1b8M.json";
  static String notfound = "$imageloc/WKGtEN8i6r.json";
  static Color appbarcolor = Colors.white;
  static Color textcolor = Colors.white;
  static Color bottomBg = appbg;
  static Color colorSeclectBottom = const Color(0xfffa2f31);
  static double iconsizeBottom = 27;

  static Color appbg = const Color(0xff10152b);
  static double textsize = 18;
  static double iconsize = 20;
}

class DataClass {
  static Map<String, dynamic> upcomingMovie = {};
  static Map<String, dynamic> topratedMovie = {};
  static Map<String, dynamic> popularMovie = {};
  static Map<String, dynamic> topratedTv = {};
  static Map<String, dynamic> popularTv = {};
  static Map<String, dynamic> section = {};

  static Map<String, dynamic> tv = {};
  static Map<String, dynamic> movie = {};
}

class LanguageClass {
  static TextEditingController lang = TextEditingController();
}

class HomeScreenClass {
  static List<IconData> bottomlist = [
    Icons.home,
    Icons.layers,
    Icons.search,
    Icons.settings
  ];
}