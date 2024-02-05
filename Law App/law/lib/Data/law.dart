import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/class/law.dart';
import 'package:http/http.dart' as http;
import 'package:law/contant/api.dart';

class LawClass {
  static TextEditingController search = TextEditingController();
  static TextEditingController controller = TextEditingController();
  static TextEditingController controllerlaw = TextEditingController();
  static List<LawsData> filteredlaw = [];
  static List<LawsData> data = [];

  static Future getData() async {
    try {
      var response = await http.get(
        Uri.parse("${ApiClass.api}/LawsControll/GetAll"),
      );
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        List<LawsData> yourRightObjects = LawsData.fromJsonList(responsebody);
        data = yourRightObjects;
        LawClass.filteredlaw = data;
        Get.appUpdate();
        Get.forceAppUpdate();
        return yourRightObjects;
      }
    } catch (e) {
      debugPrint("$e");
    }
  }
}
