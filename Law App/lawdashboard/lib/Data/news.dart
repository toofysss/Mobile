import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawdashboard/constant/api.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lawdashboard/widget/alert.dart';
import 'package:http/http.dart' as http;
import 'package:lawdashboard/widget/custombutton.dart';
import 'package:lawdashboard/widget/customtext.dart';

class NewsClass {
  static TextEditingController title = TextEditingController();
  static TextEditingController dscrp = TextEditingController();
  static File? img;

  static clear() {
    title.clear();
    dscrp.clear();
    img = null;
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
                  color: Root.headercolor,
                  data: "تحديد مكان النشر",
                  size: Root.textsize,
                  textOverflow: TextOverflow.clip,
                ),
              ),
              content: Directionality(
                textDirection:
                    // تحققق اذا التطبيق عربي او انكليزي
                    Root.lang.text == "English"
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
                            data: "اخبار عامة", ontap: () => sendBlog("1"))),
                    // en radio
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      width: Get.width,
                      child: SizedBox(
                          width: Get.width,
                          child: CustomButton(
                              data: "اخبار محامين",
                              ontap: () => sendBlog("2"))),
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
    if (img == null) {
      return AlertClass.warning("49".tr);
    }
    AlertClass.waiting();

    var url = Uri.parse('${ApiClass.api}/BlogControll/InsertBlog');
    var request = http.MultipartRequest("POST", url);
    request.fields["Title"] = title.text;
    request.fields["Status"] = "1";
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
      return AlertClass.success();
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
