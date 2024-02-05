import 'package:books/Pages/discoverypage.dart';
import 'package:books/Pages/favouritepage.dart';
import 'package:books/Pages/homepage.dart';
import 'package:books/Pages/searchpage.dart';
import 'package:books/Pages/settingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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

  static List<CategoryClass> categoryList = [
    CategoryClass(iconData: FontAwesomeIcons.headSideVirus, title: "s1".tr),
    CategoryClass(iconData: FontAwesomeIcons.bullseye, title: "s2".tr),
    CategoryClass(iconData: FontAwesomeIcons.landmark, title: "s3".tr),
    CategoryClass(iconData: FontAwesomeIcons.codeFork, title: "s4".tr),
    CategoryClass(iconData: FontAwesomeIcons.stairs, title: "s6".tr),
    CategoryClass(iconData: FontAwesomeIcons.graduationCap, title: "s19".tr),
    CategoryClass(iconData: FontAwesomeIcons.comments, title: "s8".tr),
    CategoryClass(iconData: FontAwesomeIcons.appleWhole, title: "s9".tr),
    CategoryClass(iconData: FontAwesomeIcons.heart, title: "s12".tr),
    CategoryClass(iconData: FontAwesomeIcons.bookAtlas, title: "s13".tr),
    CategoryClass(iconData: FontAwesomeIcons.earthAsia, title: "s14".tr),
    CategoryClass(iconData: FontAwesomeIcons.lightbulb, title: "s15".tr),
    CategoryClass(
        iconData: FontAwesomeIcons.personBreastfeeding, title: "s17".tr),
    CategoryClass(iconData: FontAwesomeIcons.buildingColumns, title: "s18".tr),
    CategoryClass(iconData: FontAwesomeIcons.chartSimple, title: "s20".tr),
    CategoryClass(iconData: FontAwesomeIcons.flask, title: "s21".tr),
    CategoryClass(iconData: FontAwesomeIcons.spa, title: "s11".tr),
    CategoryClass(iconData: FontAwesomeIcons.piggyBank, title: "s22".tr),
    CategoryClass(iconData: FontAwesomeIcons.leaf, title: "s16".tr),
    CategoryClass(iconData: FontAwesomeIcons.atom, title: "s10".tr),
    CategoryClass(iconData: FontAwesomeIcons.lightbulb, title: "s7".tr),
    CategoryClass(iconData: FontAwesomeIcons.handsPraying, title: "s23".tr),
  ];

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
