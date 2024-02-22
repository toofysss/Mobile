import 'package:flutter/material.dart';
import 'package:quran/Page/Home/home.dart';
import 'package:quran/Page/Quran/quran.dart';
import 'package:quran/Page/Service/service.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class HomeClass {
  static List<IconData> bottomList = [
    Icons.mosque,
    FlutterIslamicIcons.solidQuran2,
    Icons.more_horiz_outlined,
  ];

  static List<Widget> pages = const [Home(), Quran(), Service(),];
}
    // Icons.hexagon_outlined
