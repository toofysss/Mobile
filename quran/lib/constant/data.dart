import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:quran/Model/ahlalbait.dart';
import 'package:quran/Model/alamalmodel.dart';
import 'package:quran/Model/allahnamemodel.dart';
import 'package:quran/Model/azkarmodel.dart';
import 'package:quran/Model/duaamodel.dart';
import 'package:quran/Model/guidemodel.dart';
import 'package:quran/Model/hadithmodel.dart';
import 'package:quran/Model/monajamodel.dart';
import 'package:quran/Model/prayermodel.dart';
import 'package:quran/Model/quranmodel.dart';
import 'package:quran/Model/salatmodel.dart';
import 'package:quran/Model/tasbehatmodel.dart';
import 'package:quran/Model/zyaramodel.dart';
import 'package:quran/constant/root.dart';
import 'package:url_launcher/url_launcher.dart';

class DataClass {
  static openData(String id) async {
    await launchUrl(Uri.parse(id),
        mode: LaunchMode.externalNonBrowserApplication);
  }

  static Future getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return await Geolocator.requestPermission();
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    position = await Geolocator.getCurrentPosition();
    return [position.latitude, position.longitude];
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

class SalatAnbiaaList {
  static List<SalaTAnbiaa> salatAnbiaaList = [];

  static salatAnbiaaData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Salat.json');
    SalaAnbiaaModel salatAnbiaaModel =
        SalaAnbiaaModel.fromJson(json.decode(jsonString));
    salatAnbiaaList = salatAnbiaaModel.salaTAnbiaa!;
    Get.forceAppUpdate();
  }
}

class MonajaList {
  static List<Monaja> monajaList = [];

  static monajaData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Monaja.json');
    MonajaModel monajaModel = MonajaModel.fromJson(json.decode(jsonString));
    monajaList = monajaModel.monaja!;
    Get.forceAppUpdate();
  }
}

class AhlalbaitList {
  static List<AhlAlBayt> ahlAlBayt = [];
  static List<Maswomen> maswomen = [];
  static ahlalbaytData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Information.json');
    AhlAlbaitModel ahlAlBaytModel =
        AhlAlbaitModel.fromJson(json.decode(jsonString));
    ahlAlBayt = ahlAlBaytModel.ahlAlBayt!;
    maswomen = ahlAlBaytModel.maswomen!;
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

class ZyaraList {
  static List<ZyaraDays> zyaraDayList = [];
  static List<ZyaraAnbiaa> zyaraAnbiaaList = [];

  static zyaraData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/zyara.json');
    ZyaraModel zyaraModel = ZyaraModel.fromJson(json.decode(jsonString));
    zyaraDayList = zyaraModel.days!;
    zyaraAnbiaaList = zyaraModel.anbiaa!;
    Get.forceAppUpdate();
  }
}

class GuideInfoList {
  static List<Almaqamat> almaqamatList = [];
  static List<Almaraqid> almaraqidList = [];

  static guideData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/GuideInformation.json');
    GuideInfoModel guideModel =
        GuideInfoModel.fromJson(json.decode(jsonString));
    almaqamatList = guideModel.almaqamat!;
    almaraqidList = guideModel.almaraqid!;
    Get.forceAppUpdate();
  }
}

class TasbehatList {
  static List<Tasabeh> tasbehatList = [];
  static List<TasabehAlzahra> tasbehatAlzahraList = [];

  static tasbehatData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Tasbeah.json');
    TasbehatModel tasbehatModel =
        TasbehatModel.fromJson(json.decode(jsonString));
    tasbehatList = tasbehatModel.tasabeh!;
    tasbehatAlzahraList = tasbehatModel.tasabehAlzahra!;
    Get.forceAppUpdate();
  }
}

class QuranList {
  static List<Surah> quranList = [];
  static List<Juz> juzList = [];

  static quranData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Quran.json');
    QuranModel quranModel = QuranModel.fromJson(json.decode(jsonString));
    quranList = quranModel.surah!;
    juzList = quranModel.juz!;
    Get.forceAppUpdate();
  }
}

class AlamalList {
  static List<Muharram> muharram = [];
  static List<Safar> safar = [];
  static List<RabiAlAwwal> rabiAlAwwal = [];
  static List<RabialAlthaani> rabialAlthaani = [];
  static List<JumadaAlAwwal> jumadaAlAwwal = [];
  static List<JumadaAlthanni> jumadaAlthanni = [];
  static List<Rajab> rajab = [];
  static List<Shaaban> shaaban = [];
  static List<Ramadhan> ramadhan = [];
  static List<Shawwal> shawwal = [];
  static List<DhulQadah> dhulQadah = [];
  static List<DhuAlHijjah> dhuAlHijjah = [];

  static alamalData() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/Alamal.json');
    AlamalModel alamalModel = AlamalModel.fromJson(json.decode(jsonString));
    muharram = alamalModel.muharram!;
    safar = alamalModel.safar!;
    rabiAlAwwal = alamalModel.rabiAlAwwal!;
    rabialAlthaani = alamalModel.rabialAlthaani!;
    jumadaAlAwwal = alamalModel.jumadaAlAwwal!;
    jumadaAlthanni = alamalModel.jumadaAlthanni!;
    rajab = alamalModel.rajab!;
    shaaban = alamalModel.shaaban!;
    ramadhan = alamalModel.ramadhan!;
    shawwal = alamalModel.shawwal!;
    dhulQadah = alamalModel.dhulQadah!;
    dhuAlHijjah = alamalModel.dhuAlHijjah!;
    Get.forceAppUpdate();
  }
}
