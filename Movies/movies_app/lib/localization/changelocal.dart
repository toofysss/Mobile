import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Data/api.dart';
import 'package:movies_app/Data/home.dart';
import 'package:movies_app/Data/search.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/services/services.dart';

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

  getData() async {
    DataClass.upcomingMovie =
        await HomeClass.getDate("/movie/upcoming?api_key=${Api.apikey}");
    DataClass.topratedMovie =
        await HomeClass.getDate("/movie/top_rated?api_key=${Api.apikey}");
    DataClass.popularMovie =
        await HomeClass.getDate("/movie/popular?api_key=${Api.apikey}");
    DataClass.topratedTv =
        await HomeClass.getDate("/tv/top_rated?api_key=${Api.apikey}");
    DataClass.popularTv =
        await HomeClass.getDate("/tv/popular?api_key=${Api.apikey}");
    DataClass.section =
        await HomeClass.getDate("/genre/movie/list?api_key=${Api.apikey}");
    Get.forceAppUpdate();
  }

  // عند تشغيل التطبيق
  @override
  void onInit() {
    getlang();
    getData();
    SearchClass.getlist();
    super.onInit();
  }
}
