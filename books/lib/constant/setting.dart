// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:books/Design/alert.dart';
import 'package:books/constant/data.dart';
import 'package:books/constant/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingData {
  final Function()? ontap;
  final String title;
  final IconData iconData;

  SettingData({
    required this.iconData,
    required this.ontap,
    required this.title,
  });
}

class SettingPages {
  static List<SettingData> settingData = [
    SettingData(
        iconData: Icons.language,
        ontap: () => AlertClass.settingLanguage("ar".tr, "en".tr,
            (Value) => AlertClass.changelang("$Value"), "ar", "en", Root.lang),
        title: "Lang".tr),
    SettingData(
        iconData: Icons.nights_stay_outlined,
        ontap: () => AlertClass.settingLanguage("on".tr, "off".tr,
            (Value) => AlertClass.changeMode("$Value"), "on", "off", Root.mode),
        title: "Mode".tr),
    SettingData(
        iconData: Icons.language,
        ontap: () => AlertClass.settingLanguage(
            "ar".tr,
            "en".tr,
            (Value) => AlertClass.changelangSearch("$Value"),
            "ar",
            "en",
            Root.langsearch),
        title: "SearchLang".tr),
    SettingData(
        iconData: Icons.headset_mic_rounded,
        ontap: () => DataClass.views("https://wa.me/9647737446118"),
        title: "Contact".tr),
  ];
}
