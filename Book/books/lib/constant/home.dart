import 'package:books/Pages/discoverypage.dart';
import 'package:books/Pages/favouritepage.dart';
import 'package:books/Pages/homepage.dart';
import 'package:books/Pages/searchpage.dart';
import 'package:books/Pages/settingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryClass {
  final IconData iconData;
  final String title;

  CategoryClass({
    required this.iconData,
    required this.title,
  });
}

class HomeClass {
  static TextEditingController search = TextEditingController();

  static List<IconData> bottomList = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.magnifyingGlass,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.gear
  ];

  static List<Widget> pages = const [
    HomePage(),
    DiscoveryPage(),
    SearchPage(
      view: false,
    ),
    FavouritePage(),
    SettingPage(),
  ];
}
