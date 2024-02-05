import 'package:books/constant/root.dart';
import 'package:books/localization/changelocal.dart';
import 'package:books/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertClass {
  static changelang(String language) {
    LocalController myServices = Get.find();
    myServices.changeLang(language);
    Root.lang = language;
    Get.back();
    // Restart.restartApp();
  }

  static changelangSearch(String language) {
    Root.langsearch = language;
    Get.forceAppUpdate();
    Get.back();
  }

  static changeMode(String change) {
    Get.back();
    LocalController myServices = Get.find();
    myServices.changeMode(change == "on" ? true : false);
    Root.mode = change;
  }

  static settingLanguage(
          String first,
          String secound,
          Function(String? change)? ontap,
          String value1,
          String value2,
          String groupname) =>
      showModalBottomSheet(
        context: Get.context!,
        barrierColor: Colors.black38,
        backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ar radio button
              SizedBox(
                width: Get.width,
                child: RadioListTile(
                    title: CustomText(
                      color: Theme.of(Get.context!).focusColor,
                      data: first,
                      size: Root.fontsize + 4,
                    ),
                    activeColor: Theme.of(Get.context!).focusColor,
                    value: value1,
                    groupValue: groupname,
                    onChanged: ontap),
              ),
              // en radio
              SizedBox(
                width: Get.width,
                child: RadioListTile(
                  title: CustomText(
                    color: Theme.of(Get.context!).focusColor,
                    data: secound,
                    size: Root.fontsize + 4,
                  ),
                  activeColor: Theme.of(Get.context!).focusColor,
                  value: value2,
                  groupValue: groupname,
                  onChanged: ontap,
                ),
              ),
            ],
          ),
        ),
      );
}
