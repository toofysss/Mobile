import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:law/class/books.dart';
import 'package:law/class/contract.dart';
import 'package:law/class/decisionscouncilministers.dart';
import 'package:law/class/iraqbank.dart';
import 'package:law/class/yourright.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ServicesClass {
  final String title;
  final Function()? ontap;
  ServicesClass({
    required this.ontap,
    required this.title,
  });
}

// "قرارات مجلس الوزراء"
class DecisionsCouncilClass {
  static Future getYourRightData() async {
    var response = await http
        .get(Uri.parse("${ApiClass.api}/DecisionsCouncilControll/GetAll"));
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<DecisionsClass> yourRightObjects =
          DecisionsClass.fromJsonList(responsebody);
      return yourRightObjects;
    }
  }
}

// قيادة الثورة المنحل
class DecisionsTheDissolvedRevolutionaryClass {
  static Future getYourRightData() async {
    var response = await http
        .get(Uri.parse("${ApiClass.api}/DecisionsCommandControll/GetAll"));
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<DecisionsClass> yourRightObjects =
          DecisionsClass.fromJsonList(responsebody);
      return yourRightObjects;
    }
  }
}

// "اوامر سلطة ائتلاف المؤقتة"
class CoalitionProvisionalAuthorityOrdersClass {
  static getYourRightData() async {
    var response = await http
        .get(Uri.parse("${ApiClass.api}/CoalitionProvisional/GetAll"));
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<DecisionsClass> yourRightObjects =
          DecisionsClass.fromJsonList(responsebody);
      return yourRightObjects;
    }
  }
}

// حقوقك
class YourRightClass {
  static List<YourRightDataClass> yourRightObjects = [];

  static Future getYourRightData() async {
    yourRightObjects.clear();
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/RightGuide.json');
    List<dynamic> jsonData = json.decode(jsonString);
    yourRightObjects = YourRightDataClass.fromJsonList(jsonData);
    Get.forceAppUpdate();
  }
}

// جريدة الوقائع العراقية
class IraqiGazetteClass {
  static getgazetter(String search) async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/IraqiGazetteControll/$search"),
      headers: const {"accept": "*/*"},
    );
    AlertClass.waiting();
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      var responsefile = await http.get(
        Uri.parse("${responsebody['files']}"),
        headers: const {"accept": "*/*"},
      );
      if (responsefile.statusCode == 200) {
        Get.back();
        final tempDir = await getTemporaryDirectory();
        final tempPath = '${tempDir.path}/downloaded_file.pdf';
        await File(tempPath).writeAsBytes(responsefile.bodyBytes);
        await OpenFile.open(tempPath);
      } else {
        AlertClass.error("50".tr);
      }
    } else {
      AlertClass.error("50".tr);
    }
  }
}

// الكتب
class BooksClass {
  static Future getYourRightData() async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/BooksControll/GetAll"),
      headers: const {"accept": "*/*"},
    );
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      return BooksDataClass.fromJsonList(responsebody);
    }
  }
}

// البنك المركزي العراقي
class IraqBankClass {
  static Future getYourRightData() async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/IraqBank/GetAll"),
      headers: const {"accept": "*/*"},
    );
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<IraqBankData> yourRightObjects =
          IraqBankData.fromJsonList(responsebody);
      return yourRightObjects;
    }
  }
}

// قرارات محكمة التمييز
class DecisionsCassationClass {
  static Future getYourRightData() async {
    var response = await http
        .get(Uri.parse("${ApiClass.api}/DecisionsCourtCassation/GetAll"));
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<IraqBankData> yourRightObjects =
          IraqBankData.fromJsonList(responsebody);
      return yourRightObjects;
    }
  }
}

// العقود
class ContractClass {
  static Future getYourRightData() async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/Contract/GetAll"),
      headers: const {"accept": "*/*"},
    );
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<ContractData> yourRightObjects =
          ContractData.fromJsonList(responsebody);
      return yourRightObjects;
    }
  }
}

// العرائض والطلبات القانونية
class PetitionsLegalRequestsClass {
  static Future getYourRightData() async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/PetitionsLegalRequestsControll/GetAll"),
      headers: const {"accept": "*/*"},
    );
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      return ContractData.fromJsonList(responsebody);
    } else {
      AlertClass.error("50".tr);
    }
  }
}

// قرارات المحكمة الاتحادية العليا
class DecisionsFederalSupremeCourtClass {
  static getgazetter(String count, String date) async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/DecisionsFederalSupremeCourt/$count/$date"),
      headers: const {"accept": "*/*"},
    );
    AlertClass.waiting();
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      var responsefile = await http.get(
        Uri.parse("${responsebody['files']}"),
        headers: const {"accept": "*/*"},
      );
      if (responsefile.statusCode == 200) {
        Get.back();
        final tempDir = await getTemporaryDirectory();
        final tempPath = '${tempDir.path}/downloaded_file.pdf';
        await File(tempPath).writeAsBytes(responsefile.bodyBytes);
        await OpenFile.open(tempPath);
      } else {
        AlertClass.error("50".tr);
      }
    } else {
      AlertClass.error("50".tr);
    }
  }
}
