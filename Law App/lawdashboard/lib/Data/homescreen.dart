import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Pages/announcingmorerealestate.dart';
import 'package:lawdashboard/Pages/books.dart';
import 'package:lawdashboard/Pages/bookslegalwritings.dart';
import 'package:lawdashboard/Pages/coalitionprovisional.dart';
import 'package:lawdashboard/Pages/contract.dart';
import 'package:lawdashboard/Pages/decisionscommand.dart';
import 'package:lawdashboard/Pages/decisionscouncil.dart';
import 'package:lawdashboard/Pages/decisionscourt.dart';
import 'package:lawdashboard/Pages/decisionsfederalsupremecourt.dart';
import 'package:lawdashboard/Pages/iraqbank.dart';
import 'package:lawdashboard/Pages/iraqigazette.dart';
import 'package:lawdashboard/Pages/law.dart';
import 'package:lawdashboard/Pages/petitionslegalrequests.dart';
import 'package:lawdashboard/Pages/consultation.dart';
import 'package:lawdashboard/Pages/news.dart';
import 'package:lawdashboard/Pages/user.dart';
import 'package:http/http.dart' as http;
import 'package:lawdashboard/Pages/yourright.dart';
import 'package:lawdashboard/constant/api.dart';
import 'package:lawdashboard/widget/alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

class ServicesClass {
  final String title;
  final Function()? ontap;
  ServicesClass({
    required this.ontap,
    required this.title,
  });
}

class HomeScreenClass {
  static Color closecolor = Colors.red;

  static List<ServicesClass> services = [
    // القوانين
    ServicesClass(
        ontap: () => Get.to(
            () => Law(
                  title: "54".tr,
                ),
            transition: Transition.fadeIn),
        title: "54".tr),
    // الاخبار
    ServicesClass(
        ontap: () => Get.to(() => const Users(), transition: Transition.fadeIn),
        title: "2".tr),
    // طلبات استشارة قانونية
    ServicesClass(
        ontap: () =>
            Get.to(() => const Consultation(), transition: Transition.fadeIn),
        title: "3".tr),
    // العرائض والطلبات القانونية
    ServicesClass(
        ontap: () => Get.to(
            () => PetitionsLegalRequests(
                  title: '4'.tr,
                ),
            transition: Transition.fadeIn),
        title: "4".tr),
    // الاخبار
    ServicesClass(
        ontap: () => Get.to(() => const News(), transition: Transition.fadeIn),
        title: "5".tr),
    // حقوقك
    ServicesClass(
        ontap: () => Get.to(
            () => YourRight(
                  title: '6'.tr,
                ),
            transition: Transition.fadeIn),
        title: "6".tr),
    // العقود
    ServicesClass(
        ontap: () => Get.to(
            () => Contract(
                  title: "7".tr,
                ),
            transition: Transition.fadeIn),
        title: "7".tr),
    // قرارات محكمة التمييز
    ServicesClass(
        ontap: () => Get.to(
            () => DecisionsCourtCassation(
                  title: '8'.tr,
                ),
            transition: Transition.fadeIn),
        title: "8".tr),
    // قرارات مجلس المحكمة الاتحادية العليا
    ServicesClass(
        ontap: () => Get.to(
            () => DecisionsFederalSupremeCourt(
                  title: "9".tr,
                ),
            transition: Transition.fadeIn),
        title: "9".tr),
    // قرارات مجلس قيادة الثورة المنحل
    ServicesClass(
        ontap: () => Get.to(
            () => DecisionsCommandControll(
                  title: "10".tr,
                ),
            transition: Transition.fadeIn),
        title: "10".tr),
    // قرارات مجلس الوزراء
    ServicesClass(
        ontap: () => Get.to(
            () => DecisionsCouncil(
                  title: "11".tr,
                ),
            transition: Transition.fadeIn),
        title: "11".tr),
    // البنك المركزي
    ServicesClass(
        ontap: () => Get.to(
            () => IraqBank(
                  title: '12'.tr,
                ),
            transition: Transition.fadeIn),
        title: "12".tr),
    //  الكتب
    ServicesClass(
        ontap: () => Get.to(
            () => Books(
                  title: "13".tr,
                ),
            transition: Transition.fadeIn),
        title: "13".tr),
    // اوامر سلطة الائتلاف المؤقتة
    ServicesClass(
        ontap: () => Get.to(
            () => CoalitionProvisional(
                  title: "14".tr,
                ),
            transition: Transition.fadeIn),
        title: "14".tr),
    // جريدة الاحوال العراقية
    ServicesClass(
        ontap: () => Get.to(
            () => IraqiGazette(
                  title: "15".tr,
                ),
            transition: Transition.fadeIn),
        title: "15".tr),
    //  اعلان المزيدات العقارية
    ServicesClass(
        ontap: () => Get.to(
            () => AnnouncingMoreRealEstate(
                  title: "56".tr,
                ),
            transition: Transition.fadeIn),
        title: "56".tr),
    // كتب ومؤلفات قانونية
    ServicesClass(
        ontap: () => Get.to(
            () => BooksLegalWritings(
                  title: "55".tr,
                ),
            transition: Transition.fadeIn),
        title: "55".tr),
  ];
}

class Data {
  static List filterData = [];
  static List listData = [];
  static bool isSearching = false;
  static TextEditingController search = TextEditingController();
  static TextEditingController title = TextEditingController();
  static TextEditingController details = TextEditingController();
  static TextEditingController files = TextEditingController();
  static TextEditingController img = TextEditingController();
  static File? files2;
  static clear() {
    search.clear();
    title.clear();
    search.clear();
    details.clear();
    files.clear();
    img.clear();
    files2 = null;
  }

  static getData(String data) async {
    var response = await http.get(Uri.parse("${ApiClass.api}/$data"),
        headers: {"accept": "text/plain"});
    if (response.statusCode == 200) {
      filterData = jsonDecode(response.body);
      clear();
      return filterData;
    }
  }

  static updateData(String data, Map<String, dynamic> json) async {
    AlertClass.waiting();
    var response = await http.put(
      Uri.parse("${ApiClass.api}/$data"),
      headers: {"accept": "text/plain", "Content-Type": "application/json"},
      body: jsonEncode(json),
    );
    if (response.statusCode == 200) {
      clear();
      AlertClass.success();
    }
  }

  static insertData(String data, Map<String, dynamic> json) async {
    AlertClass.waiting();

    var response = await http.post(
      Uri.parse("${ApiClass.api}/$data"),
      headers: {"accept": "text/plain", "Content-Type": "application/json"},
      body: jsonEncode(json),
    );
    if (response.statusCode == 200) {
      clear();
      AlertClass.success();
    }
  }

  static insertUser(String data, Map<String, dynamic> json, String password,
      String username) async {
    var response = await http.post(
      Uri.parse("${ApiClass.api}/$data"),
      headers: {"accept": "*/*", "Content-Type": "application/json"},
      body: jsonEncode(json),
    );
    if (response.statusCode == 200) {
      String message = '''
اسم المستخدم الخاص بك : $username
كلمة المرور الخاصة بك : $password
''';
      AlertClass.sendmsg(message);
    }
  }

  static deleteData(String data) async {
    AlertClass.waiting();

    var response = await http.delete(
      Uri.parse("${ApiClass.api}/$data"),
      headers: {"accept": "text/plain", "Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      clear();
      AlertClass.success();
    }
  }

  static urllauncher(String url) async {
    await launchUrl(Uri.parse(url));
  }

  static pickfiles() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result == null) return;
    PlatformFile filepicker = result.files.first;
    files2 = File(filepicker.path!);
    AlertClass.upload();
  }

  static inserfile(String data) async {
    if (files2 == null) {
      return AlertClass.warning("يرجى تحميل الملف");
    } else if (title.text.isEmpty) {
      return AlertClass.warning("يرجى ملأ البيانات");
    }
    AlertClass.waiting();
    var url = Uri.parse('${ApiClass.api}/$data');
    var request = http.MultipartRequest("POST", url);
    request.fields["ID"] = "0";
    request.fields["files"] = "";
    request.fields["dscrp"] = title.text;
    var files = await http.MultipartFile.fromPath(
      "file",
      files2!.path,
    );
    request.files.add(files);

    var response = await request.send();
    if (response.statusCode == 200) {
      AlertClass.success();
    }
  }

  static updatefile(String data, String id) async {
    if (files2 == null) {
      return AlertClass.warning("يرجى تحميل الملف");
    } else if (title.text.isEmpty) {
      return AlertClass.warning("يرجى ملأ البيانات");
    }
    AlertClass.waiting();
    var url = Uri.parse('${ApiClass.api}/$data');
    var request = http.MultipartRequest("POST", url);
    request.headers['accept'] = '*/*';
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields["ID"] = id;
    request.fields["files"] = "";
    request.fields["dscrp"] = title.text;
    var files = await http.MultipartFile.fromPath(
      "file",
      files2!.path,
    );
    request.files.add(files);
    var response = await request.send();
    if (response.statusCode == 200) {
      AlertClass.success();
      clear();
    }
  }
}

// "اعلان المزيدات العقارية"
class AnnouncingMoreRealEstateClass {
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
    if (img == null) {
      return AlertClass.warning("49".tr);
    }
    AlertClass.waiting();
    var url = Uri.parse('${ApiClass.api}/AnnouncingMoreRealEstate/Insert');
    var request = http.MultipartRequest("POST", url);
    request.fields["Lawname"] = lawname.text;
    request.fields["Status"] = "1";
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
      return AlertClass.success();
    }
  }
}

class DropdownItem {
  final String value;
  final String label;

  DropdownItem(this.value, this.label);
}

class RigesterClass {
  static List<DropdownItem> goverment = [];
  static TextEditingController name = TextEditingController();
  static TextEditingController gender = TextEditingController();
  static TextEditingController depart = TextEditingController();
  static TextEditingController city = TextEditingController();
  static TextEditingController cityID = TextEditingController();
  static String cityid = "";
  static TextEditingController phone = TextEditingController();
  static TextEditingController room = TextEditingController();
  static TextEditingController dscrp = TextEditingController();
  static TextEditingController rating = TextEditingController();
  static File? img;
  static File? imgcardlaw;

  static pickimg() async {
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    img = File(result.path);
    AlertClass.upload();
  }

  static pickimgcardlaw() async {
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    imgcardlaw = File(result.path);
    AlertClass.upload();
  }

  static rigester() async {
    if (imgcardlaw == null || img == null) {
      return AlertClass.warning("38".tr);
    } else if (name.text.isEmpty &&
        gender.text.isEmpty &&
        depart.text.isEmpty &&
        city.text.isEmpty &&
        cityid.isEmpty &&
        room.text.isEmpty &&
        dscrp.text.isEmpty) {
      return AlertClass.warning("51".tr);
    }
    AlertClass.waiting();
    var url = Uri.parse('${ApiClass.api}/LaweysControll/InsertLaweys');
    var request = http.MultipartRequest("POST", url);
    request.fields["ID"] = "0";
    request.fields["Name"] = name.text;
    request.fields["Gender"] = gender.text == "29".tr ? "0" : "1";
    request.fields["Depart"] = depart.text;
    request.fields["City"] = city.text;
    request.fields["CityID"] = cityid;
    request.fields["Phone"] = phone.text;
    request.fields["Room"] = room.text;
    request.fields["Dscrp"] = dscrp.text;
    request.fields["Rating"] = "0";
    request.fields["Img"] = "";
    request.fields["Imgcardlaw"] = "";
    request.fields["Status"] = "0";

    // Add the image file
    var file = await http.MultipartFile.fromPath(
      "img",
      img!.path,
    );
    var file2 = await http.MultipartFile.fromPath(
      "imgCardLaw",
      imgcardlaw!.path,
    );
    request.files.add(file);
    request.files.add(file2);

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      String passowrd = "${Random().nextInt(1000000)}";
      Data.insertUser(
          "UserControll/AddUser",
          {
            "id": 0,
            "username": phone.text,
            "password": passowrd,
            "lawersID": responseString,
            "amount": "string"
          },
          passowrd,
          phone.text);
    }
  }

  static clear() {
    name.clear();
    gender.clear();
    depart.clear();
    city.clear();
    cityID.clear();
    phone.clear();
    room.clear();
    dscrp.clear();
    rating.clear();
    img = null;
    imgcardlaw = null;
  }
}
