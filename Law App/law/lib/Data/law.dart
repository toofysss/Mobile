import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:law/class/law.dart';
import 'package:law/contant/root.dart';

class LawClass {
  static List<LawsData> filteredlaw = [];
  static List<LawsData> data = [];

  static Future getData() async {
    data.clear();
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Laws.json');
    List<dynamic> jsonData = json.decode(jsonString);
    data = LawsData.fromJsonList(jsonData);
    filteredlaw = LawsData.fromJsonList(jsonData);
    Get.forceAppUpdate();
  }
}
