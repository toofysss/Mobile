import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/goverment.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/law.dart';
import 'package:law/Data/services.dart';
import 'package:law/Page/services/cases.dart';
import 'package:law/class/datahelper.dart';
import 'package:law/contant/root.dart';
import 'package:law/services/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  getSetting() {
    if (myServices.sharedPreferences.getDouble("size") != null) {
      Root.textsize = myServices.sharedPreferences.getDouble("size")!;
    }
    if (myServices.sharedPreferences.getString("lawersID") != null) {
      Data.laweysID = myServices.sharedPreferences.getString("lawersID")!;
    }
  }

  addData() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) Data.online = false;
    if (Data.online) {
      DBHelper().insertPetitionsLegalRequestsList(
          await PetitionsLegalRequestsClass.getYourRightData(),
          'petitionslegalrequests');
      DBHelper().insertPetitionsLegalRequestsList(
          await BooksClass.getYourRightData(), 'books');
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
      DBHelper().insertData(await IraqBankClass.getYourRightData(), 'iraqbank',
          'iraqbank_details', "iraqBankID");
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
    String? lang = myServices.sharedPreferences.getString("lang");
    if (lang != null) {
      language = Locale(lang);
      Root.lang = lang;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      Root.lang = Get.deviceLocale!.languageCode;
    }
  }

  getData() {
    LawClass.getData();
    GovermentClass.govermentData();
    YourRightClass.getYourRightData();
    DBHelper().createCases();
    CasesController controller = Get.put(CasesController());
    controller.getcasec();
  }

// عند تشغيل التطبيق
  @override
  void onInit() {
    getData();
    getlang();
    getSetting();
    DBHelper().initDB();
    addData();
    super.onInit();
  }
}
