// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Page/aboutus.dart';
import 'package:law/Page/login/login.dart';
import 'package:law/contant/root.dart';
import 'package:law/localization/changelocal.dart';
import 'package:law/services/services.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:restart_app/restart_app.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: Data.laweysID.text.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: SizedBox(
              width: Get.width * .8,
              height: 60,
              child: CustomButton(
                  data: "60".tr,
                  ontap: () {
                    MyServices myServices = Get.find();
                    Data.laweysID.clear();
                    myServices.sharedPreferences.remove("lawersID");
                    Get.appUpdate();
                    Get.forceAppUpdate();
                  })),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomText(
                    color: Root.primary,
                    data: "25".tr,
                    size: Root.headersize,
                    textOverflow: TextOverflow.clip),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Root.primary)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      Visibility(
                        visible: Data.laweysID.text.isEmpty,
                        child: GestureDetector(
                          onTap: () => Get.to(() => const Login(),
                              transition: Transition.fadeIn),
                          child: ListTile(
                            leading: Icon(
                              Icons.login,
                              color: Root.primary,
                              size: 35,
                            ),
                            title: CustomText(
                              color: Root.primary,
                              data: "57".tr,
                              size: Root.textsize,
                              textOverflow: TextOverflow.clip,
                            ),
                            trailing: Icon(
                              Icons.arrow_right_rounded,
                              size: Root.headersize + 5,
                              color: Root.primary,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: Data.laweysID.text.isEmpty,
                        child: Divider(
                          endIndent: 35,
                          indent: 35,
                          thickness: 1.5,
                          color: Root.primary,
                        ),
                      ),
                      // Lang
                      GestureDetector(
                        onTap: () => showGeneralDialog(
                          context: Get.context!,
                          barrierDismissible: true,
                          barrierLabel: "",
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Container(),
                          transitionDuration: const Duration(milliseconds: 200),
                          transitionBuilder: (context, a1, a2, child) {
                            return ScaleTransition(
                              scale:
                                  Tween<double>(begin: .5, end: 1).animate(a1),
                              child: FadeTransition(
                                opacity: Tween<double>(begin: .5, end: 1)
                                    .animate(a1),
                                child: Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Root.backgroundApp,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Center(
                                          child: CustomText(
                                            color: Root.primary,
                                            data: "29".tr,
                                            size: Root.headersize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      // ar radio button
                                      SizedBox(
                                        width: Get.width,
                                        child: RadioListTile(
                                          title: CustomText(
                                            data: "30".tr,
                                            color: Root.primary,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                          activeColor: Root.primary,
                                          value: "Arabic",
                                          groupValue: LanguageClass.lang.text,
                                          onChanged: (Value) {
                                            LocalController myServices =
                                                Get.find();
                                            myServices.changeLang("ar");
                                            LanguageClass.lang.text = "$Value";
                                            Restart.restartApp();
                                          },
                                        ),
                                      ),
                                      // en radio
                                      SizedBox(
                                        width: Get.width,
                                        child: RadioListTile(
                                          title: CustomText(
                                            data: "31".tr,
                                            color: Root.primary,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                          activeColor: Root.primary,
                                          value: "English",
                                          groupValue: LanguageClass.lang.text,
                                          onChanged: (Value) {
                                            LocalController myServices =
                                                Get.find();
                                            myServices.changeLang("en");
                                            LanguageClass.lang.text = "$Value";
                                            Get.back();
                                            Restart.restartApp();
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 35, vertical: 10),
                                        child: GestureDetector(
                                            child: Center(
                                          child: CustomButton(
                                              data: "85".tr,
                                              ontap: () => Get.back()),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.language,
                            color: Root.primary,
                            size: 35,
                          ),
                          title: CustomText(
                            color: Root.primary,
                            data: "29".tr,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip,
                          ),
                          trailing: Icon(
                            Icons.arrow_right_rounded,
                            size: Root.headersize + 5,
                            color: Root.primary,
                          ),
                        ),
                      ),

                      Divider(
                        endIndent: 35,
                        indent: 35,
                        thickness: 1.5,
                        color: Root.primary,
                      ),
                      // Change Size
                      GestureDetector(
                        onTap: () => showGeneralDialog(
                          context: Get.context!,
                          barrierDismissible: true,
                          barrierLabel: "",
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Container(),
                          transitionDuration: const Duration(milliseconds: 200),
                          transitionBuilder: (context, a1, a2, child) {
                            return ScaleTransition(
                              scale:
                                  Tween<double>(begin: .5, end: 1).animate(a1),
                              child: FadeTransition(
                                opacity: Tween<double>(begin: .5, end: 1)
                                    .animate(a1),
                                child: Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: Root.backgroundApp,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Center(
                                          child: CustomText(
                                            color: Root.primary,
                                            data: "33".tr,
                                            size: Root.headersize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      Slider(
                                        min: 10,
                                        max: 40,
                                        divisions: 10,
                                        activeColor: Root.primary,
                                        inactiveColor: Root.primary,
                                        label: Root.textsize.round().toString(),
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.transparent),
                                        onChanged: (size) {
                                          Root.textsize = size;
                                          LocalController()
                                              .myServices
                                              .sharedPreferences
                                              .setDouble("size", Root.textsize);
                                          Get.forceAppUpdate();
                                        },
                                        value: Root.textsize,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 35, vertical: 10),
                                        child: GestureDetector(
                                            child: Center(
                                          child: CustomButton(
                                              data: "85".tr,
                                              ontap: () => Get.back()),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        child: ListTile(
                          leading: Icon(
                            FontAwesomeIcons.textWidth,
                            color: Root.primary,
                            size: 35,
                          ),
                          title: CustomText(
                            color: Root.primary,
                            data: "32".tr,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip,
                          ),
                          trailing: Icon(
                            Icons.arrow_right_rounded,
                            size: Root.headersize + 5,
                            color: Root.primary,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 35,
                        indent: 35,
                        thickness: 1.5,
                        color: Root.primary,
                      ),
                      // Contact Us
                      GestureDetector(
                        onTap: () =>
                            Data.urllauncher("https://wa.me/964${Root.phone}"),
                        child: ListTile(
                          leading: Icon(
                            Icons.headset_mic_rounded,
                            color: Root.primary,
                            size: 35,
                          ),
                          title: CustomText(
                            color: Root.primary,
                            data: "218".tr,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip,
                          ),
                          trailing: Icon(
                            Icons.arrow_right_rounded,
                            size: Root.headersize + 5,
                            color: Root.primary,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 35,
                        indent: 35,
                        thickness: 1.5,
                        color: Root.primary,
                      ),
                      // About Us
                      GestureDetector(
                        onTap: () => Get.to(() => const AboutUs(),
                            transition: Transition.fadeIn),
                        child: ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: Root.primary,
                            size: 35,
                          ),
                          title: CustomText(
                            color: Root.primary,
                            data: "219".tr,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip,
                          ),
                          trailing: Icon(
                            Icons.arrow_right_rounded,
                            size: Root.headersize + 5,
                            color: Root.primary,
                          ),
                        ),
                      ),
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
