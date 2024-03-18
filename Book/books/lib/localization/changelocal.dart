import 'dart:convert';
import 'package:books/class/searchingdata.dart';
import 'package:books/constant/data.dart';
import 'package:books/constant/root.dart';
import 'package:books/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  // تغيير اللغة
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  // تغيير الوضع
  changeMode(bool langcode) {
    myServices.sharedPreferences.setBool("Mode", langcode);
    Root.themeMode = langcode ? ThemeMode.dark : ThemeMode.light;
    Get.forceAppUpdate();
  }

  // get lang
  getlang() {
    String? lang = myServices.sharedPreferences.getString("lang");
    if (lang != null) {
      language = Locale(lang);
      Root.lang = lang;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      Root.lang = Get.deviceLocale!.languageCode;
    }
  }

  getMode() {
    bool? devicemode = myServices.sharedPreferences.getBool("Mode");
    if (devicemode != null) {
      Root.themeMode = devicemode ? ThemeMode.dark : ThemeMode.light;
      Root.mode = devicemode ? "on" : "off";
    } else {
      Root.mode = Get.isPlatformDarkMode ? "on" : "off";
    }
  }

  getFavourite() {
    List<String>? favourite =
        myServices.sharedPreferences.getStringList("Favourite");
    if (favourite != null) {
      DataClass.favourite = favourite
          .map((jsonString) => Items.fromJson(json.decode(jsonString)))
          .toList();
      Get.forceAppUpdate();
    }
  }

  getdescover() async {
    DataClass.psychology = await DataClass.searchData("Psychology");
    DataClass.love = await DataClass.searchData("Love");
    DataClass.history = await DataClass.searchData("History");
    DataClass.eduction = await DataClass.searchData("Eduction");
    DataClass.science = await DataClass.searchData("Science");
  }

// عند تشغيل التطبيق
  @override
  void onInit() {
    getdescover();
    getlang();
    getMode();
    getFavourite();
    super.onInit();
  }
}
