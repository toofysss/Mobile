import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:law/contant/api.dart';
import 'package:law/widget/alert.dart';
import 'package:http/http.dart' as http;

class LoginClass {
  static TextEditingController username = TextEditingController();
  static TextEditingController pass = TextEditingController();

  static clear() {
    username.clear();
    pass.clear();
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
      return AlertClass.warning("187".tr);
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
    request.fields["Gender"] = gender.text == "63".tr ? "0" : "1";
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
      clear();
      return AlertClass.success("48".tr);
    } else {
      return AlertClass.error("50".tr);
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
