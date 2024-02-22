import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/services/services.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  // تغيير اللغة
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    LanguageClass.lang.text = "$locale";
    Get.updateLocale(locale);
    Get.back();
  }

// get lang
  getlang() {
    String? lang = myServices.sharedPreferences.getString("lang");
    if (lang != null) {
      language = Locale(lang);
      Get.updateLocale(language!);
      LanguageClass.lang.text = lang;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      LanguageClass.lang.text = Get.deviceLocale!.languageCode;
      Get.updateLocale(language!);
    }
  }

  getData() {
    SectionClass.getSection();
  }

// عند تشغيل التطبيق
  @override
  void onInit() {
    getlang();
    getData();
    Data.getdata();
    super.onInit();
  }
}
