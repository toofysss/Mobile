import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lawdashboard/services/services.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  getdata() {
    // if (myServices.sharedPreferences.getString("lawersID") != null) {
    //   Data.laweysID.text = myServices.sharedPreferences.getString("lawersID")!;
    // }
  }

// تغيير اللغة
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  getlang() {
    String? sharedPreferences = myServices.sharedPreferences.getString("lang");
    if (sharedPreferences == "ar") {
      language = const Locale("ar");
      Root.lang.text = "Arabic";
    } else if (sharedPreferences == "en") {
      language = const Locale("en");
      Root.lang.text = "English";
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (language!.languageCode == "en") {
        language = const Locale("en");
        Root.lang.text = "English";
      } else {
        language = const Locale("ar");
        Root.lang.text = "Arabic";
      }
    }
  }

// عند تشغيل التطبيق
  @override
  void onInit() {
    getdata();
    getlang();
    super.onInit();
  }
}
