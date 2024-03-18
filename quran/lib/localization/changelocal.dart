import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran/constant/data.dart';
import '../constant/root.dart';
import '../services/services.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  setLanguage(String lang) {
    language = Locale(lang);
    Root.lang = lang;
    HijriCalendar.setLocal(lang);
  }

  getlang() {
    String? lang = myServices.sharedPreferences.getString("lang");
    lang != null
        ? setLanguage(lang)
        : setLanguage(Get.deviceLocale!.languageCode);
  }

  getlocation() async {
    double? latitude = myServices.sharedPreferences.getDouble("latitude");
    double? longitude = myServices.sharedPreferences.getDouble("longitude");
    if ( latitude != null && longitude != null) {
      Root.latitude = latitude;
      Root.longitude = longitude;
    } else {
      var data = await DataClass.getLocation();
      Root.latitude = data[0];
      Root.longitude = data[1];
      myServices.sharedPreferences.setDouble("latitude", Root.latitude);
      myServices.sharedPreferences.setDouble("longitude", Root.longitude);
    }
    update();
  }

  getData() async {
    QuranList.quranData();
    DuaaList.duaaData();
    HadithList.hadithData();
    AllahNameList.allahNameData();
    PrayerList.prayerData();
    AzkarList.azkarData();
    SalatAnbiaaList.salatAnbiaaData();
    MonajaList.monajaData();
    ZyaraList.zyaraData();
    GuideInfoList.guideData();
    TasbehatList.tasbehatData();
    AhlalbaitList.ahlalbaytData();
    AlamalList.alamalData();
  }

  @override
  void onInit() {
    getlocation();
    getlang();
    getData();
    super.onInit();
  }
}
