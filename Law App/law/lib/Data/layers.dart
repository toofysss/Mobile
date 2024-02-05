import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:law/contant/api.dart';

class LayersClass {
  static TextEditingController searchController = TextEditingController();
  static List filteredDetails = [];
  static Future getYourRightData() async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/CityControll/GetAll"),
      headers: const {"accept": "*/*"},
    );
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      return responsebody;
    }
  }
}
