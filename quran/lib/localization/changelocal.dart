import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/data.dart';
import '../constant/root.dart';
import '../services/services.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

// تغيير اللغة
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Root.lang = "$locale";
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
    }
  }

  getData() async {
    DuaaList.duaaData();
    HadithList.hadithData();
    AllahNameList.allahNameData();
    PrayerList.prayerData();
    AzkarList.azkarData();
  }

// عند تشغيل التطبيق
  @override
  void onInit() {
    getlang();
    getMode();
    getData();
    super.onInit();
  }
}
