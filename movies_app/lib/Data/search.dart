import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies_app/Data/api.dart';
import 'package:http/http.dart' as http;

class DropdownItem {
  final int value;
  final String label;

  DropdownItem(this.value, this.label);
}

class SearchClass {
  static TextEditingController search = TextEditingController();
  static TextEditingController year = TextEditingController();
  static TextEditingController secation = TextEditingController();
  static List<DropdownItem> dropdownsection = [];
  static int selectedYearfrom = DateTime.now().year;
  static int selectedYearto = DateTime.now().year;
  static String sectionid = "";

  static Future searchData(
    String name,
  ) async {
    final Uri uri = Uri.parse('${Api.apiMovie}$name');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      return responseBody;
    }
  }

  static Future getlist() async {
    dropdownsection.clear();
    final Uri uri =
        Uri.parse('${Api.apiMovie}/genre/movie/list?api_key=${Api.apikey}');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      for (var item in jsonData['genres']) {
        dropdownsection.add(DropdownItem(item['id'], item['name']));
      }
      return dropdownsection;
    }
  }

  static clear() {
    search.clear();
    year.clear();
    secation.clear();
    sectionid = "";
  }
}
