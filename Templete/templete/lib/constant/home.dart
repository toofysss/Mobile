import 'package:flutter/material.dart';

class Item {
  String title;
  Function() ontap;
  Item({
    required this.title,
    required this.ontap,
  });
}

class HomeScreenClass {
  static TextEditingController search = TextEditingController();
  static List<Item> filterimtes = [];
}
