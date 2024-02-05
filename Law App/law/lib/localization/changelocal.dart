import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/law.dart';
import 'package:law/Data/services.dart';
import 'package:law/class/datahelper.dart';
import 'package:law/contant/root.dart';
import 'package:law/services/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  getdata() {
    if (myServices.sharedPreferences.getDouble("size") != null) {
      Root.textsize = myServices.sharedPreferences.getDouble("size")!;
    }
    if (myServices.sharedPreferences.getString("lawersID") != null) {
      Data.laweysID.text = myServices.sharedPreferences.getString("lawersID")!;
    }
  }

  addData() async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) Data.online = false;
      if (Data.online) {
        DBHelper().createCases();
        DBHelper()
            .insertlaw(await LawClass.getData(), 'laws', 'lawdetails', "lawID");
        DBHelper().insertPetitionsLegalRequestsList(
            await PetitionsLegalRequestsClass.getYourRightData(),
            'petitionslegalrequests');
        DBHelper().insertPetitionsLegalRequestsList(
            await BooksClass.getYourRightData(), 'books');
        DBHelper().insertPetitionsLegalRequestsList(
            await BooksLegalWritingsClass.getYourRightData(),
            'BooksLegalWritings');
        DBHelper().insertPetitionsLegalRequestsList(
            await AnnouncingMoreRealEstateClass.getYourRightData(),
            'AnnouncingMoreRealEstate');
        DBHelper().insertPetitionsLegalRequestsList(
            await CoalitionProvisionalAuthorityOrdersClass.getYourRightData(),
            'coalitionprovisional');
        DBHelper().insertPetitionsLegalRequestsList(
            await ContractClass.getYourRightData(), 'contract');
        DBHelper().insertPetitionsLegalRequestsList(
            await DecisionsTheDissolvedRevolutionaryClass.getYourRightData(),
            'decisionscommand');
        DBHelper().insertPetitionsLegalRequestsList(
            await DecisionsCouncilClass.getYourRightData(), 'decisionscouncil');
        DBHelper().insertData(
            await DecisionsCassationClass.getYourRightData(),
            'decisionscourtcassation',
            'decisionscourtcassationdetails',
            "decisionsCourtCassationID");
        DBHelper().insertData(await IraqBankClass.getYourRightData(),
            'iraqbank', 'iraqbank_details', "iraqBankID");
        DBHelper().insertYourRight(await YourRightClass.getYourRightData(),
            'rightsguide', 'rightsdetails', "rightGuideID");
        DBHelper().insertDiscriminatoryregulationsData(
            await DiscriminatoryregulationsClass.getYourRightData(),
            'discriminatoryregulations',
            "discriminatoryregulationsDetails",
            "discriminatoryregulationsID");
      } else {
        await DBHelper().fetchDataLaw('laws', 'lawdetails', "lawID");
        CasesClass.getcasec();
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

// تغيير اللغة
  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

// get lang
  getlang() {
    String? sharedPreferences = myServices.sharedPreferences.getString("lang");
    if (sharedPreferences == "ar") {
      language = const Locale("ar");
      LanguageClass.lang.text = "Arabic";
    } else if (sharedPreferences == "en") {
      language = const Locale("en");
      LanguageClass.lang.text = "English";
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (language!.languageCode == "en") {
        language = const Locale("en");
        LanguageClass.lang.text = "English";
      } else {
        language = const Locale("ar");
        LanguageClass.lang.text = "Arabic";
      }
    }
  }

// عند تشغيل التطبيق
  @override
  void onInit() {
    getlang();
    getdata();
    DBHelper().initDB();
    addData();
    super.onInit();
  }
}
