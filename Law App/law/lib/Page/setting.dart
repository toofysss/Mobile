// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customsettingdesign.dart';
import 'package:law/Page/setting/login/login.dart';
import 'package:law/Page/setting/aboutus.dart';
import 'package:law/contant/root.dart';
import 'package:law/localization/changelocal.dart';
import 'package:law/services/services.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
            color: Theme.of(context).appBarTheme.foregroundColor!,
            data: "25".tr,
            size: Root.textsize,
            textOverflow: TextOverflow.clip),
        leading: const BackPageButton(),
      ),
      floatingActionButton: Visibility(
        visible: Data.laweysID.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: SizedBox(
              width: Get.width * .8,
              height: 60,
              child: CustomButton(
                  data: "60".tr,
                  ontap: () {
                    MyServices myServices = Get.find();
                    Data.laweysID = "";
                    myServices.sharedPreferences.remove("lawersID");
                    Get.forceAppUpdate();
                  })),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ]),
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: [
                      // Login
                      CustomSettingDesign(
                          divider: Data.laweysID.isEmpty,
                          iconData: Icons.login,
                          visible: Data.laweysID.isEmpty,
                          ontap: () => Get.to(() => const Login(),
                              transition: Transition.fadeIn),
                          title: "57".tr),
                      // Lang
                      CustomSettingDesign(
                          divider: true,
                          iconData: Icons.language,
                          visible: true,
                          ontap: () => AlertClass.showalert(
                                "29".tr,
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: Get.width,
                                      child: RadioListTile(
                                          title: CustomText(
                                            data: "30".tr,
                                            color: Theme.of(context)
                                                .indicatorColor,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                          activeColor: Theme.of(context).indicatorColor,
                                          value: "ar",
                                          groupValue: Root.lang,
                                          onChanged: (Value) =>
                                              AlertClass.changelang("$Value")),
                                    ),
                                    // en radio
                                    SizedBox(
                                      width: Get.width,
                                      child: RadioListTile(
                                          title: CustomText(
                                            data: "31".tr,
                                            color: Theme.of(context)
                                                .indicatorColor,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                          activeColor: Theme.of(context).indicatorColor,
                                          value: "en",
                                          groupValue: Root.lang,
                                          onChanged: (Value) =>
                                              AlertClass.changelang("$Value")),
                                    ),
                                  ],
                                ),
                              ),
                          title: "29".tr),

                      // Change Size
                      CustomSettingDesign(
                          divider: true,
                          iconData: FontAwesomeIcons.textWidth,
                          visible: true,
                          ontap: () => AlertClass.showalert(
                                "29".tr,
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Slider(
                                      min: 10,
                                      max: 40,
                                      divisions: 10,
                                      activeColor:
                                          Theme.of(context).indicatorColor,
                                      inactiveColor: Theme.of(context)
                                          .indicatorColor
                                          .withOpacity(.7),
                                      label: Root.textsize.round().toString(),
                                      overlayColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.transparent),
                                      onChanged: (size) {
                                        setState(() {
                                          Root.textsize = size;
                                        });
                                        Get.forceAppUpdate();
                                        LocalController()
                                            .myServices
                                            .sharedPreferences
                                            .setDouble("size", Root.textsize);
                                      },
                                      value: Root.textsize,
                                    ),
                                  ],
                                ),
                              ),
                          title: "32".tr),

                      // Contact Us
                      CustomSettingDesign(
                          divider: true,
                          iconData: Icons.headset_mic_rounded,
                          visible: true,
                          ontap: () =>
                              Data.urllauncher("https://mustafa--cv.web.app/"),
                          title: "218".tr),

                      // About Us
                      CustomSettingDesign(
                          divider: false,
                          iconData: Icons.info_outline,
                          visible: true,
                          ontap: () => Get.to(() => const AboutUs(),
                              transition: Transition.fadeIn),
                          title: "219".tr),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
