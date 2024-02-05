// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Data/home.dart';
import 'package:movies_app/localization/changelocal.dart';
import 'package:movies_app/widget/customtext.dart';

class Root {
  static String imageloc = "images";
  static String logo = "$imageloc/logo.png";
  static String loading = "$imageloc/JId29j1b8M.json";
  static String notfound = "$imageloc/WKGtEN8i6r.json";
  static Color appbarcolor = Colors.white;
  static Color textcolor = Colors.white;
  static Color bottomBg = appbg;
  static Color colorSeclectBottom = const Color(0xfffa2f31);
  static double iconsizeBottom = 27;

  static Color appbg = const Color(0xff10152b);
  static double textsize = 18;
  static double iconsize = 20;
}

class DataClass {
  static Map<String, dynamic> upcomingMovie = {};
  static Map<String, dynamic> topratedMovie = {};
  static Map<String, dynamic> popularMovie = {};
  static Map<String, dynamic> topratedTv = {};
  static Map<String, dynamic> popularTv = {};
  static Map<String, dynamic> section = {};

  static Map<String, dynamic> tv = {};
  static Map<String, dynamic> movie = {};
}

class LanguageClass {
  static TextEditingController lang = TextEditingController();
}

class HomeScreenClass {
  static List<IconData> bottomlist = [
    Icons.home,
    Icons.layers,
    Icons.search,
    Icons.settings
  ];
}

class ProfileClass {
  final Function()? ontap;
  final String title;
  final IconData iconData;

  ProfileClass({
    required this.ontap,
    required this.title,
    required this.iconData,
  });
}

class ProfileClassData {
  static List<ProfileClass> profileClassData = [
    ProfileClass(
        ontap: () => showGeneralDialog(
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
                      backgroundColor: Root.textcolor,
                      title: Center(
                        child: CustomText(
                            textOverflow: TextOverflow.ellipsis,
                            colors: Root.appbg,
                            data: "Lang".tr,
                            size: Root.textsize),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ar radio button
                          SizedBox(
                            width: Get.width,
                            child: RadioListTile(
                                title: Text(
                                  "ar".tr,
                                  style: TextStyle(
                                      fontSize: Root.textsize,
                                      fontWeight: FontWeight.bold,
                                      color: Root.appbg),
                                ),
                                activeColor: Root.appbg,
                                value: "ar",
                                groupValue: LanguageClass.lang.text,
                                onChanged: (String? Value) =>
                                    LocalController().changeLang("ar")),
                          ),
                          // en radio
                          SizedBox(
                              width: Get.width,
                              child: RadioListTile(
                                  title: Text(
                                    "en".tr,
                                    style: TextStyle(
                                        fontSize: Root.textsize,
                                        fontWeight: FontWeight.bold,
                                        color: Root.appbg),
                                  ),
                                  activeColor: Root.appbg,
                                  value: "en",
                                  groupValue: LanguageClass.lang.text,
                                  onChanged: (Value) =>
                                      LocalController().changeLang("en"))),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        title: "Lang".tr,
        iconData: Icons.language_rounded),
    ProfileClass(
        ontap: () => HomeClass.urllauncher("https://wa.me/9647737446118"),
        title: "Contact".tr,
        iconData: Icons.headset_mic_rounded)
  ];
}
