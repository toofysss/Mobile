import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Page/Section/layers.dart';
import 'package:law/Page/services/appointmentlawyer.dart';
import 'package:law/Page/services/books.dart';
import 'package:law/Page/services/cases.dart';
import 'package:law/Page/services/consultation.dart';
import 'package:law/Page/services/contracts.dart';
import 'package:law/Page/services/decisionscouncil.dart';
import 'package:law/Page/services/discriminatoryregulations.dart';
import 'package:law/Page/services/iraqbank.dart';
import 'package:law/Page/services/iraqportal.dart';
import 'package:law/Page/services/yourright.dart';
import 'package:law/class/announcingmorerealestate.dart';
import 'package:law/class/books.dart';
import 'package:law/class/contract.dart';
import 'package:law/class/datahelper.dart';
import 'package:law/class/decisionscouncilministers.dart';
import 'package:law/class/discriminatoryregulations.dart';
import 'package:law/class/iraqbank.dart';
import 'package:law/class/yourright.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
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

class ServicesSection {
  static TextEditingController searchController = TextEditingController();
  static List<DecisionsClass> filteredDetails = [];
  static List<ServicesClass> servicesList = [
    // توكيل محامي
    ServicesClass(
        ontap: () => Get.to(() => const AppointmentLawyer(),
            transition: Transition.fadeIn),
        title: "12".tr),
    // استشارة قانونية
    ServicesClass(
        ontap: () => Get.to(() => const Consultation(userID: '0'),
            transition: Transition.fadeIn),
        title: "11".tr),
    // العرائض والطلبات
    ServicesClass(
        ontap: () async {
          if (Data.laweysID.text.isEmpty) {
            return AlertClass.success("108".tr);
          }
          List<ContractData> yourRightData = await DBHelper()
              .getPetitionsLegalRequests('petitionslegalrequests');
          Get.to(
            () => Contract(
              title: '13'.tr,
              data: yourRightData,
            ),
            transition: Transition.fadeIn,
          );
        },
        title: "13".tr),
    // لوائح تميزية
    ServicesClass(
        ontap: () async {
          if (Data.laweysID.text.isEmpty) {
            return AlertClass.success("108".tr);
          }
          List<DiscriminatoryregulationsData> yourRightData = await DBHelper()
              .fetchDataDiscriminatoryregulationsData(
                  'Discriminatoryregulations',
                  "DiscriminatoryregulationsDetails",
                  "DiscriminatoryregulationsID");
          Get.to(
            () => Discriminatoryregulations(
              title: '111'.tr,
              data: yourRightData,
            ),
            transition: Transition.fadeIn,
          );
        },
        title: "111".tr),
    // العقود
    ServicesClass(
        ontap: () async {
          List<ContractData> yourRightData =
              await DBHelper().getPetitionsLegalRequests('contract');
          Get.to(() => ContractSelect(title: '16'.tr, data: yourRightData),
              transition: Transition.fadeIn);
        },
        title: "16".tr),
    // جدول القضايا
    ServicesClass(
        ontap: () async {
          if (Data.laweysID.text.isEmpty) {
            return AlertClass.success("108".tr);
          }
          Get.to(() => const Cases(), transition: Transition.fadeIn);
        },
        title: "74".tr),
    // بوابة القضاء العراقي
    ServicesClass(
        ontap: () =>
            Get.to(() => const IraqPortal(), transition: Transition.fadeIn),
        title: "14".tr),
    // قرارات محكمة التمييز
    ServicesClass(
        ontap: () async {
          List<IraqBankData> yourRightData = await DBHelper().fetchData(
              'decisionscourtcassation',
              'decisionscourtcassationdetails',
              "decisionsCourtCassationID");
          Get.to(() => IraqBank(data: yourRightData, title: "17".tr),
              transition: Transition.fadeIn);
        },
        title: "17".tr),
    // المحكمة الاتحادية العليا
    ServicesClass(
        ontap: () async {
          DecisionsFederalSupremeCourtClass.count.clear();
          DecisionsFederalSupremeCourtClass.date.clear();
          showGeneralDialog(
            context: Get.context!,
            barrierDismissible: true,
            barrierLabel: "",
            pageBuilder: (context, animation, secondaryAnimation) =>
                Container(),
            transitionDuration: const Duration(milliseconds: 200),
            transitionBuilder: (context, a1, a2, child) {
              return ScaleTransition(
                scale: Tween<double>(begin: .5, end: 1).animate(a1),
                child: FadeTransition(
                  opacity: Tween<double>(begin: .5, end: 1).animate(a1),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Root.backgroundApp,
                    title: Center(
                      child: CustomText(
                        color: Root.primary,
                        data: "18".tr,
                        size: Root.textsize,
                        textOverflow: TextOverflow.clip,
                      ),
                    ),
                    content: Directionality(
                      textDirection: LanguageClass.lang.text == "English"
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextField(
                              onChanged: (s) {},
                              textInputType: TextInputType.number,
                              controller:
                                  DecisionsFederalSupremeCourtClass.count,
                              maxline: 1,
                              maxlength: 50,
                              hints: "83".tr,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextField(
                              onChanged: (s) {},
                              textInputType: TextInputType.datetime,
                              controller:
                                  DecisionsFederalSupremeCourtClass.date,
                              maxline: 1,
                              maxlength: 50,
                              hints: "84".tr,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: CustomButton(
                              data: "46".tr,
                              ontap: () => DecisionsFederalSupremeCourtClass
                                  .getgazetter(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: CustomButton(
                              data: "85".tr,
                              ontap: () => Get.back(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        title: "18".tr),
    // // دليل المحامين
    // ServicesClass(
    //     ontap: () => Data.urllauncher("https://e-court.sjc.iq/lawyers-guide"),
    //     title: "52".tr),

    // دردشة مع الذكاء الاصطناعي
    ServicesClass(
        ontap: () => Data.urllauncher("https://chat.openai.com/"),
        title: "96".tr),
    // حقوقك
    ServicesClass(
        ontap: () async {
          List<YourRightDataClass> yourRightData = await DBHelper()
              .fetchDataYourright(
                  'rightsguide', 'rightsdetails', "rightGuideID");
          Get.to(() => YourRight(yourRightInstance: yourRightData),
              transition: Transition.fadeIn);
        },
        title: "15".tr),
    
    // // كتب ومؤلفات قانونية
    // ServicesClass(
    //     ontap: () async {
    //       List<BooksDataClass> yourRightData =
    //           await DBHelper().getBooksDataClass('BooksLegalWritings');
    //       Get.to(
    //           () => BooksLegalWritings(
    //                 data: yourRightData,
    //                 title: "156".tr,
    //               ),
    //           transition: Transition.fadeIn);
    //     },
    //     title: "156".tr),
    // // اعلان المزيدات العقارية
    // ServicesClass(
    //     ontap: () async {
    //       List<AnnouncingMoreRealEstateData> yourRightData = await DBHelper()
    //           .getAnnouncingMoreRealEstateDataClass('AnnouncingMoreRealEstate');
    //       Get.to(
    //           () => AnnouncingMoreRealEstate(
    //                 data: yourRightData,
    //                 title: "157".tr,
    //               ),
    //           transition: Transition.fadeIn);
    //     },
    //     title: "157".tr),

    // جريدة الوقائع العراقية
    ServicesClass(
        ontap: () async {
          IraqiGazetteClass.search.clear();
          showGeneralDialog(
            context: Get.context!,
            barrierDismissible: true,
            barrierLabel: "",
            pageBuilder: (context, animation, secondaryAnimation) =>
                Container(),
            transitionDuration: const Duration(milliseconds: 200),
            transitionBuilder: (context, a1, a2, child) {
              return ScaleTransition(
                scale: Tween<double>(begin: .5, end: 1).animate(a1),
                child: FadeTransition(
                  opacity: Tween<double>(begin: .5, end: 1).animate(a1),
                  child: AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Root.backgroundApp,
                    title: Center(
                      child: CustomText(
                        color: Root.primary,
                        data: "24".tr,
                        size: Root.textsize,
                        textOverflow: TextOverflow.clip,
                      ),
                    ),
                    content: Directionality(
                        textDirection:
                            // تحققق اذا التطبيق عربي او انكليزي
                            LanguageClass.lang.text == "English"
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextField(
                                onChanged: (s) {},
                                textInputType: TextInputType.number,
                                controller: IraqiGazetteClass.search,
                                maxline: 1,
                                maxlength: 50,
                                hints: "45".tr),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: CustomButton(
                                  data: "46".tr,
                                  ontap: () => IraqiGazetteClass.getgazetter()),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: CustomButton(
                                data: "85".tr,
                                ontap: () => Get.back(),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              );
            },
          );
        },
        title: "24".tr),
    // قرارات مجلس الوزراء
    ServicesClass(
        ontap: () async {
          List<DecisionsClass> yourRightData =
              await DBHelper().getDecisionsClass("decisionscouncil");
          Get.to(
            () => DecisionsCouncilMinisters(
              data: yourRightData,
              title: "20".tr,
            ),
            transition: Transition.fadeIn,
          );
        },
        title: "20".tr),
    // قرارات مجلس قيادة الثورة المنحل
    ServicesClass(
        ontap: () async {
          List<DecisionsClass> yourRightData =
              await DBHelper().getDecisionsClass("decisionscommand");
          Get.to(
            () => DecisionsCouncilMinisters(
              data: yourRightData,
              title: "19".tr,
            ),
            transition: Transition.fadeIn,
          );
        },
        title: "19".tr),
    // البنك المركزي العراقي
    ServicesClass(
        ontap: () async {
          List<IraqBankData> yourRightData = await DBHelper()
              .fetchData('iraqbank', 'iraqbank_details', "iraqBankID");
          Get.to(() => IraqBank(data: yourRightData, title: "21".tr),
              transition: Transition.fadeIn);
        },
        title: "21".tr),
    // الكتب
    ServicesClass(
        ontap: () async {
          List<BooksDataClass> yourRightData =
              await DBHelper().getBooksDataClass('books');
          Get.to(
              () => Books(
                    data: yourRightData,
                    title: "22".tr,
                  ),
              transition: Transition.fadeIn);
        },
        title: "22".tr),
    // اوامر سلطة ائتلاف القانون
    ServicesClass(
        ontap: () async {
          List<DecisionsClass> yourRightData =
              await DBHelper().getDecisionsClass("coalitionprovisional");
          Get.to(
              () => DecisionsCouncilMinisters(
                    data: yourRightData,
                    title: "23".tr,
                  ),
              transition: Transition.fadeIn);
        },
        title: "23".tr),
  ];
}

// توكيل محامي
class AppointmentLawyerClass {
  static TextEditingController coverment = TextEditingController();
  static TextEditingController department = TextEditingController();
  static TextEditingController court = TextEditingController();

  static clear() {
    coverment.clear();
    court.clear();
    department.clear();
  }

  static searchlawers() async {
    if (Data.online) {
      if (coverment.text.isEmpty ||
          department.text.isEmpty ||
          court.text.isEmpty) {
        return AlertClass.warning("51".tr);
      }
      var response = await http.get(
          Uri.parse(
              "${ApiClass.api}/LaweysControll/GetBy?depart=${department.text}&govermentID=${coverment.text}&room=${court.text}"),
          headers: {"accept": "text/plain"});
      if (response.statusCode == 200) {
        List responsebody = jsonDecode(response.body);
        if (responsebody[0]['details'].isEmpty) {
          return AlertClass.warning("53".tr);
        }
        Get.to(
            () => Layers(
                  data: '12'.tr,
                  items: responsebody[0]['details'],
                ),
            transition: Transition.fadeIn);
        clear();
      } else {
        return AlertClass.warning("53".tr);
      }
    } else {
      AlertClass.error("50".tr);
    }
  }
}

// الاستشارات القانونية
class ConsultationClass {
  static TextEditingController type = TextEditingController();
  static TextEditingController address = TextEditingController();
  static TextEditingController whatsapp = TextEditingController();
  static TextEditingController dscrp = TextEditingController();

  static File? files;

  static pickfile() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result == null) return;
    PlatformFile filepicker = result.files.first;
    ConsultationClass.files = File(filepicker.path!);
    Get.forceAppUpdate();
    AlertClass.upload();
  }

  static clear() {
    type.clear();
    address.clear();
    whatsapp.clear();
    dscrp.clear();
    files = null;
  }

  static sendfile(String userID) async {
    if (Data.online != true) {
      return AlertClass.error("50".tr);
    }
    if (files == null) {
      return AlertClass.warning("49".tr);
    }

    AlertClass.waiting();
    var url = Uri.parse('${ApiClass.api}/Consultation/Insert');
    var request = http.MultipartRequest("POST", url);
    request.fields["UserID"] = userID;
    request.fields["Phone"] = whatsapp.text;
    request.fields["Status"] = "0";
    request.fields["Dscrp"] = dscrp.text;
    request.fields["Address"] = address.text;
    request.fields["Files"] = "";
    request.fields["Type"] = type.text;
    request.fields["ID"] = "0";

    // Add the image file
    var file = await http.MultipartFile.fromPath(
      "file",
      files!.path,
    );
    request.files.add(file);

    var response = await request.send();
    if (response.statusCode == 200) {
      Get.back();
      clear();
      return AlertClass.success("48".tr);
    }
  }
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

// لوائح تميزية
class DiscriminatoryregulationsClass {
  static Future getYourRightData() async {
    var response = await http
        .get(Uri.parse("${ApiClass.api}/Discriminatoryregulations/GetAll"));
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<DiscriminatoryregulationsData> yourRightObjects =
          DiscriminatoryregulationsData.fromJsonList(responsebody);
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
  static Future getYourRightData() async {
    // if (Data.online) {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/RightGuideControll/GetAll"),
      headers: const {"accept": "*/*"},
    );
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<YourRightDataClass> yourRightObjects =
          YourRightDataClass.fromJsonList(responsebody);
      return yourRightObjects;
    }
    // }
  }
}

// جريدة الوقائع العراقية
class IraqiGazetteClass {
  static TextEditingController search = TextEditingController();
  static getgazetter() async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/IraqiGazetteControll/${search.text}"),
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
  static List<BooksDataClass> filteredDetails = [];

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

// "كتب ومؤلفات قانونية"
class BooksLegalWritingsClass {
  static List<BooksDataClass> filteredDetails = [];

  static Future getYourRightData() async {
    var response = await http.get(
      Uri.parse("${ApiClass.api}/BooksLegalWritings/GetAll"),
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
  static List<IraqBankData> filteredDetails = [];

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
  static List<IraqBankData> filteredDetails = [];

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

// "اعلان المزيدات العقارية"
class AnnouncingMoreRealEstateClass {
  static List<AnnouncingMoreRealEstateData> filteredDetails = [];
  static File? img;
  static TextEditingController lawname = TextEditingController();
  static TextEditingController type = TextEditingController();
  static TextEditingController owners = TextEditingController();
  static TextEditingController space = TextEditingController();
  static TextEditingController address = TextEditingController();
  static TextEditingController price = TextEditingController();
  static TextEditingController date = TextEditingController();
  static TextEditingController dscrp = TextEditingController();

  static clear() {
    img = null;
    lawname.clear();
    type.clear();
    owners.clear();
    space.clear();
    address.clear();
    price.clear();
    date.clear();
    dscrp.clear();
  }

  static pickfile() async {
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    img = File(result.path);
    Get.appUpdate();
    Get.forceAppUpdate();
  }

  static send() async {
    if (Data.online != true) {
      return AlertClass.error("50".tr);
    }
    if (img == null) {
      return AlertClass.warning("49".tr);
    }
    AlertClass.waiting();

    var url = Uri.parse('${ApiClass.api}/AnnouncingMoreRealEstate/Insert');
    var request = http.MultipartRequest("POST", url);
    request.fields["Lawname"] = lawname.text;
    request.fields["Status"] = "0";
    request.fields["Type"] = type.text;
    request.fields["Owners"] = owners.text;
    request.fields["Address"] = address.text;
    request.fields["Space"] = space.text;
    request.fields["Price"] = price.text;
    request.fields["Date"] = date.text;
    request.fields["Dscrp"] = dscrp.text;
    request.fields["Img"] = '';
    request.fields["ID"] = "0";

    // Add the image file
    var file = await http.MultipartFile.fromPath(
      "file",
      img!.path,
    );
    request.files.add(file);

    var response = await request.send();
    if (response.statusCode == 200) {
      Get.back();
      clear();
      return AlertClass.success("93".tr);
    }
  }

  static Future getYourRightData() async {
    var response = await http
        .get(Uri.parse("${ApiClass.api}/AnnouncingMoreRealEstate/GetAll"));
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      List<AnnouncingMoreRealEstateData> yourRightObjects =
          AnnouncingMoreRealEstateData.fromJsonList(responsebody);
      return yourRightObjects;
    }
  }
}

// العقود
class ContractClass {
  static List<ContractData> filteredDetails = [];

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

  static Future wordfile(String data) async {}
}

// بوابة القضاء العراقية
class IraqPortalClass {
  static List<ServicesClass> iraqPortal = [
    ServicesClass(
        ontap: () => Data.urllauncher("https://e-court.sjc.iq/qassam"),
        title: "26".tr),
    ServicesClass(
        ontap: () =>
            Data.urllauncher("https://e-court.sjc.iq/marriage-contract"),
        title: "27".tr),
    ServicesClass(
        ontap: () => Data.urllauncher("https://e-court.sjc.iq/arguments"),
        title: "28".tr),
  ];
}

// العرائض والطلبات القانونية
class PetitionsLegalRequestsClass {
  static List<ContractData> filteredDetails = [];

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

// نشر خبر
class NewsClass {
  static TextEditingController title = TextEditingController();
  static TextEditingController dscrp = TextEditingController();
  static File? img;

  static clear() {
    title.clear();
    dscrp.clear();
    img = null;
    Get.appUpdate();
    Get.forceAppUpdate();
  }

  static selectType() {
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: .5, end: 1).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: .5, end: 1).animate(a1),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Root.backgroundApp,
              title: Center(
                child: CustomText(
                  color: Root.primary,
                  data: "92".tr,
                  size: Root.textsize,
                  textOverflow: TextOverflow.clip,
                ),
              ),
              content: Directionality(
                textDirection:
                    // تحققق اذا التطبيق عربي او انكليزي
                    LanguageClass.lang.text == "English"
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ar radio button
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        width: Get.width,
                        child: CustomButton(
                            data: "8".tr, ontap: () => sendBlog("1"))),
                    // en radio
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: Get.width,
                      child: SizedBox(
                          width: Get.width,
                          child: CustomButton(
                              data: "9".tr, ontap: () => sendBlog("2"))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static sendBlog(String type) async {
    if (Data.online != true) {
      return AlertClass.error("50".tr);
    }
    if (img == null) {
      return AlertClass.warning("49".tr);
    }
    AlertClass.waiting();

    var url = Uri.parse('${ApiClass.api}/BlogControll/InsertBlog');
    var request = http.MultipartRequest("POST", url);
    request.fields["Title"] = title.text;
    request.fields["Status"] = "0";
    request.fields["Dscrp"] = dscrp.text;
    request.fields["Date"] = DateTime.now().toLocal().toString().split(' ')[0];
    request.fields["Img"] = "";
    request.fields["BlogTypeID"] = type;
    request.fields["ID"] = "0";

    // Add the image file
    var file = await http.MultipartFile.fromPath(
      "img",
      img!.path,
    );
    request.files.add(file);

    var response = await request.send();
    if (response.statusCode == 200) {
      Get.back();
      clear();
      return AlertClass.success("93".tr);
    }
  }

  static pickfile() async {
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    img = File(result.path);
    Get.appUpdate();
    Get.forceAppUpdate();
  }
}

// جدول القضايا
class CasesClass {
  static TextEditingController type = TextEditingController();
  static TextEditingController price = TextEditingController();
  static TextEditingController date = TextEditingController();
  static List casesData = [];

  static Future getcasec() async {
    casesData = await DBHelper().getCases();
    Get.appUpdate();
    Get.forceAppUpdate();
  }

  static clear() {
    type.clear();
    price.clear();
    date.clear();
  }
}

// قرارات المحكمة الاتحادية العليا
class DecisionsFederalSupremeCourtClass {
  static TextEditingController count = TextEditingController();
  static TextEditingController date = TextEditingController();

  static getgazetter() async {
    var response = await http.get(
      Uri.parse(
          "${ApiClass.api}/DecisionsFederalSupremeCourt/${count.text}/${date.text}"),
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
