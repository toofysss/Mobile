// ignore_for_file: non_constant_identifier_names, duplicate_ignore, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/localization/changelocal.dart';
import 'package:templete/operation/adddata.dart';
import 'package:templete/operation/addsection.dart';
import 'package:templete/operation/editdata.dart';
import 'package:templete/operation/editsection.dart';
import 'package:templete/widget/customtext.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LanguageClass.lang.text == "English"
          ? TextDirection.rtl
          : TextDirection.rtl,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 170,
                height: 170,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Root.logoimage), fit: BoxFit.fill)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Root.textcolor)),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  onTap: () => Get.to(
                      () => AddSection(
                            edit: false,
                            hint: '3'.tr,
                          ),
                      transition: Transition.fadeIn),
                  trailing: Icon(
                    Icons.arrow_right_sharp,
                    size: Root.iconsize + 10,
                    color: Root.textcolor,
                  ),
                  title: CusomtText(
                      color: Root.textcolor, data: "3".tr, size: Root.textsize),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Root.textcolor)),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  onTap: () => Get.to(
                      () => AddData(
                            edit: false,
                            hint: '4'.tr,
                          ),
                      transition: Transition.fadeIn),
                  trailing: Icon(
                    Icons.arrow_right_sharp,
                    size: Root.iconsize + 10,
                    color: Root.textcolor,
                  ),
                  title: CusomtText(
                      color: Root.textcolor, data: "4".tr, size: Root.textsize),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Root.textcolor)),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  onTap: () => showGeneralDialog(
                    context: context,
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
                              child: CusomtText(
                                  color: Root.bg,
                                  data: "5".tr,
                                  size: Root.textsize),
                            ),
                            content: Directionality(
                              textDirection:
                                  // تحققق اذا التطبيق عربي او انكليزي
                                  LanguageClass.lang.text == "English"
                                      ? TextDirection.ltr
                                      : TextDirection.rtl,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // ar radio button
                                  SizedBox(
                                    width: Get.width,
                                    child: RadioListTile(
                                        title: Text(
                                          "6".tr,
                                          style: TextStyle(
                                              fontSize: Root.textsize,
                                              fontWeight: FontWeight.bold,
                                              color: Root.primary),
                                        ),
                                        activeColor: Root.primary,
                                        value: "Arabic",
                                        groupValue: LanguageClass.lang.text,
                                        onChanged: (Value) {
                                          setState(() {
                                            LocalController myServices =
                                                Get.find();
                                            myServices.changeLang("ar");
                                            LanguageClass.lang.text = "$Value";
                                            Restart.restartApp();
                                            Get.back();
                                          });
                                        }),
                                  ),
                                  // en radio
                                  SizedBox(
                                    width: Get.width,
                                    child: RadioListTile(
                                        title: Text(
                                          "7".tr,
                                          style: TextStyle(
                                              fontSize: Root.textsize,
                                              fontWeight: FontWeight.bold,
                                              color: Root.primary),
                                        ),
                                        activeColor: Root.primary,
                                        value: "English",
                                        groupValue: LanguageClass.lang.text,
                                        onChanged: (Value) {
                                          setState(() {
                                            LocalController myServices =
                                                Get.find();
                                            myServices.changeLang("en");
                                            LanguageClass.lang.text = "$Value";
                                            Get.back();
                                            Restart.restartApp();
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  trailing: Icon(
                    Icons.arrow_right_sharp,
                    size: Root.iconsize + 10,
                    color: Root.textcolor,
                  ),
                  title: CusomtText(
                      color: Root.textcolor, data: "5".tr, size: Root.textsize),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Root.textcolor)),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  onTap: () => Get.to(() => const EditSection(),
                      transition: Transition.fadeIn),
                  trailing: Icon(
                    Icons.arrow_right_sharp,
                    size: Root.iconsize + 10,
                    color: Root.textcolor,
                  ),
                  title: CusomtText(
                      color: Root.textcolor, data: "8".tr, size: Root.textsize),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1.5, color: Root.textcolor)),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  onTap: () => Get.to(
                      () => EditData(
                            hint: '9'.tr,
                          ),
                      transition: Transition.fadeIn),
                  trailing: Icon(
                    Icons.arrow_right_sharp,
                    size: Root.iconsize + 10,
                    color: Root.textcolor,
                  ),
                  title: CusomtText(
                      color: Root.textcolor, data: "9".tr, size: Root.textsize),
                ),
              )
            ],
          )),
    );
  }
}
