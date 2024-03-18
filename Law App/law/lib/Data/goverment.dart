import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:law/class/goverment.dart';
import 'package:law/contant/root.dart';

class GovermentClass {
  static List<Data> govermentlist = [];

  static govermentData() async {
    govermentlist.clear();
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/goverment.json');
    Goverment goverment = Goverment.fromJson(json.decode(jsonString));
    govermentlist = goverment.data!;
    Get.forceAppUpdate();
  }
}
