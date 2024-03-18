import 'dart:convert';
import 'package:books/Api/api.dart';
import 'package:books/class/searchingdata.dart';
import 'package:books/constant/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DataClass {
  static List<SearchingData> search = [];
  static List<Items> favourite = [];
  static List<SearchingData> psychology = [];
  static List<SearchingData> love = [];
  static List<SearchingData> history = [];
  static List<SearchingData> eduction = [];
  static List<SearchingData> science = [];
  static Future searchData(String data) async {
    try {
      var response = await http.get(Uri.parse(
          "https://www.googleapis.com/books/v1/volumes?q=$data+subject&key=${ApiClass.apiKey}&maxResults=40&langRestrict=${Root.langsearch}"));
      if (response.statusCode == 200) {
        var responseMap = jsonDecode(response.body);
        var searchingData = SearchingData.fromJson(responseMap);
        List<SearchingData> data = [];
        for (int i = 1; i <= responseMap['items'].length; i++) {
          data.add(searchingData);
        }
        search = data;
        Get.forceAppUpdate();
        return data;
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  static views(String id) async {
    await launchUrl(Uri.parse(id),
        mode: LaunchMode.externalNonBrowserApplication);
  }
}
