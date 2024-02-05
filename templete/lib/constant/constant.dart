import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Root {
  static const Color primary = Colors.black;
  static const Color bgprimary = Colors.black;
  static const Color bg = Color(0xff181b2c);
  static const Color textcolor = Color(0xffffffff);
  static String locimage = "images";
  static String logoimage = "$locimage/logo.png";
  static double textsize = 20;
  static double iconsize = 20;
}

class IconList {
  IconData? icons;
  String title;
  IconList({required this.icons, required this.title});
}

class SectionList {
  int? id;
  String section;
  SectionList({required this.id, required this.section});
}

class Data {
  static List<IconList> iconList = [
    IconList(icons: Icons.home, title: "10".tr),
    IconList(icons: Icons.layers, title: "11".tr),
    IconList(icons: Icons.search, title: "12".tr),
    IconList(icons: Icons.settings, title: "13".tr),
  ];

  static TextEditingController search = TextEditingController();

  static List json = [];
  static List filterjson = [];

  static Future getdata() async {
    var respone = await http.get(
        Uri.parse("http://www.templete.somee.com/Notes"),
        headers: {"accept": "text/plain"});
    if (respone.statusCode == 200) {
      json = jsonDecode(respone.body);
      Get.forceAppUpdate();
      Get.appUpdate();
      return json;
    }
  }
}

class LanguageClass {
  static TextEditingController lang = TextEditingController();
}

class SectionClass {
  static List sectionList = [];
  static getSection() async {
    var response = await http.get(
        Uri.parse("http://www.templete.somee.com/Section/GET"),
        headers: {"accept": "text/plain"});

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      sectionList = jsonData.map((item) {
        return SectionList(id: item['id'], section: item['sections']);
      }).toList();
      return sectionList;
    }
  }

}

class OperationClass {
  static TextEditingController section = TextEditingController();
  static int? sectionID;

  static TextEditingController videolink = TextEditingController();
  static TextEditingController dscrp = TextEditingController();
  static TextEditingController sections = TextEditingController();

  static clean() {
    section.clear();
    sectionID = 0;
    videolink.clear();
    dscrp.clear();
    sections.clear();
  }

  static sectionoperation(bool edit) async {
    if (edit) {
      Map<String, dynamic> data = {"id": sectionID, "sections": section.text};

      var response = await http.put(
        Uri.parse("http://www.private.somee.com/Section/Update"),
        headers: {
          "accept": "text/plain",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Get.back();
      }
    } else {
      Map<String, dynamic> data = {"sections": section.text};

      var response = await http.post(
        Uri.parse("http://www.private.somee.com/Section/Insert"),
        headers: {"accept": " */*", "Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Get.back();
      }
    }
    clean();
  }

  static dataoperation(bool edit) async {
    if (edit) {
      Map<String, dynamic> data = {"id": sectionID};

      var response = await http.delete(
        Uri.parse("http://www.private.somee.com/Notes/remove"),
        headers: {
          "accept": "text/plain",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Get.back();
      }
    } else {
      Map<String, dynamic> data = {
        "sectionID": sectionID,
        "dscrp": dscrp.text,
        "bg": videolink.text
      };

      var response = await http.post(
        Uri.parse("http://www.private.somee.com/Notes/Insert"),
        headers: {"accept": " */*", "Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        Get.back();
      }
    }
    clean();
  }
}
