// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/Data/home.dart';
import 'package:movies_app/Design/settingdesign.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/localization/changelocal.dart';
import 'package:movies_app/widget/customtext.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(Root.logo), fit: BoxFit.fill)),
          ),
          Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white.withOpacity(.13)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(.15),
                    Colors.white.withOpacity(.05),
                  ],
                ),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingDesign(
                        divider: true,
                        iconData: Icons.language_rounded,
                        ontap: () => showGeneralDialog(
                              context: Get.context!,
                              barrierDismissible: true,
                              barrierLabel: "",
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      Container(),
                              transitionDuration:
                                  const Duration(milliseconds: 200),
                              transitionBuilder: (context, a1, a2, child) {
                                return ScaleTransition(
                                  scale: Tween<double>(begin: .5, end: 1)
                                      .animate(a1),
                                  child: FadeTransition(
                                    opacity: Tween<double>(begin: .5, end: 1)
                                        .animate(a1),
                                    child: AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Root.appbg),
                                                ),
                                                activeColor: Root.appbg,
                                                value: "ar",
                                                groupValue:
                                                    LanguageClass.lang.text,
                                                onChanged: (String? Value) =>
                                                    LocalController()
                                                        .changeLang("ar")),
                                          ),
                                          // en radio
                                          SizedBox(
                                              width: Get.width,
                                              child: RadioListTile(
                                                  title: Text(
                                                    "en".tr,
                                                    style: TextStyle(
                                                        fontSize: Root.textsize,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Root.appbg),
                                                  ),
                                                  activeColor: Root.appbg,
                                                  value: "en",
                                                  groupValue:
                                                      LanguageClass.lang.text,
                                                  onChanged: (Value) =>
                                                      LocalController()
                                                          .changeLang("en"))),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                        title: "Lang".tr),
                    SettingDesign(
                        divider: false,
                        iconData: Icons.headset_mic_rounded,
                        ontap: () => HomeClass.urllauncher(
                            "https://mustafa--cv.web.app/"),
                        title: "Contact".tr)
                  ])),
        ],
      ),
    );
  }
}
