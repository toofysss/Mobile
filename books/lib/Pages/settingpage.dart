// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:books/Design/alert.dart';
import 'package:books/Design/settingdesign.dart';
import 'package:books/constant/data.dart';
import 'package:books/constant/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 25),
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          Root.mode == "on" ? Root.logodark : Root.logo),
                      fit: BoxFit.fill)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(29),
              border: Border.all(color: Theme.of(context).cardColor),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 5,
                  color: Theme.of(context).shadowColor,
                ),
              ],
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SettingDesign(
                  divider: true,
                  iconData: Icons.language,
                  ontap: () => AlertClass.settingLanguage(
                      "ar".tr,
                      "en".tr,
                      (Value) => AlertClass.changelang("$Value"),
                      "ar",
                      "en",
                      Root.lang),
                  title: "Lang".tr),
              SettingDesign(
                  divider: true,
                  iconData: Icons.nights_stay_outlined,
                  ontap: () => AlertClass.settingLanguage(
                      "on".tr,
                      "off".tr,
                      (Value) => AlertClass.changeMode("$Value"),
                      "on",
                      "off",
                      Root.mode),
                  title: "Mode".tr),
              SettingDesign(
                  divider: true,
                  iconData: Icons.language,
                  ontap: () => AlertClass.settingLanguage(
                      "ar".tr,
                      "en".tr,
                      (Value) => AlertClass.changelangSearch("$Value"),
                      "ar",
                      "en",
                      Root.langsearch),
                  title: "SearchLang".tr),
              SettingDesign(
                  divider: false,
                  iconData: Icons.headset_mic_rounded,
                  ontap: () => DataClass.views("https://mustafa--cv.web.app/"),
                  title: "Contact".tr),
            ]),
          )
        ],
      ),
    );
  }
}
