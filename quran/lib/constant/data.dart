// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:quran/Model/allahnamemodel.dart';
import 'package:quran/Model/azkarmodel.dart';
import 'package:quran/Model/duaamodel.dart';
import 'package:quran/Model/hadithmodel.dart';
import 'package:quran/Model/prayermodel.dart';
import 'package:quran/constant/root.dart';
import 'package:url_launcher/url_launcher.dart';

class DataClass {
  static openData(String id) async {
    await launchUrl(Uri.parse(id),
        mode: LaunchMode.externalNonBrowserApplication);
  }

  Future<String> getlocation() async {
    // bool serviceEnabled;
    // LocationPermission permission;
    Position position;
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    // return
    // }
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     return Future.error('Location permissions are denied');
    //   } else if (permission == LocationPermission.whileInUse) {}
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   // Permissions are denied forever, handle appropriately.
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }
    position = await Geolocator.getCurrentPosition();
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return "${placemark[0].locality}";
  }
}

class DuaaList {
  static List<Days> daysList = [];
  static List<DuaaQuran> duaaQuranList = [];
  static List<Duaa> duaaList = [];

  static duaaData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Duaa.json');
    DuaaModel duaaModel = DuaaModel.fromJson(json.decode(jsonString));
    daysList = duaaModel.days!;
    duaaList = duaaModel.duaa!;
    duaaQuranList = duaaModel.duaaQuran!;
    Get.forceAppUpdate();
  }
}

class HadithList {
  static List<Hadiths> hadithList = [];

  static hadithData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Hadith.json');
    HadithModel hadithModel = HadithModel.fromJson(json.decode(jsonString));
    hadithList = hadithModel.hadiths!;
    Get.forceAppUpdate();
  }
}

class AllahNameList {
  static List<AlaahName> allahNameList = [];

  static allahNameData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/AlaahName.json');
    AllahNameModel allahNameModel =
        AllahNameModel.fromJson(json.decode(jsonString));
    allahNameList = allahNameModel.alaahName!;
    Get.forceAppUpdate();
  }
}

class PrayerList {
  static List<Prayers> prayerList = [];

  static prayerData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Prayer.json');
    PrayerModel allahNameModel = PrayerModel.fromJson(json.decode(jsonString));
    prayerList = allahNameModel.prayer!;
    Get.forceAppUpdate();
  }
}

class AzkarList {
  static List<Morning> morningList = [];
  static List<Wakeup> wakeupList = [];
  static List<Sala> salaList = [];
  static List<Sleep> sleepList = [];
  static List<Evening> eveningList = [];

  static azkarData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Azkar.json');
    AzkarModel azkarModel = AzkarModel.fromJson(json.decode(jsonString));
    morningList = azkarModel.morning!;
    wakeupList = azkarModel.wakeup!;
    salaList = azkarModel.sala!;
    sleepList = azkarModel.sleep!;
    eveningList = azkarModel.evening!;
    Get.forceAppUpdate();
  }
}
