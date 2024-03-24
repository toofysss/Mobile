import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:translator/Data/languagecode.dart';
import 'package:translator/Page/customtextfield.dart';
import 'package:translator/Page/setting.dart';
import 'package:translator/UI/bgdesign.dart';
import 'package:translator/UI/buttondesign.dart';
import 'package:translator/constant/root.dart';

class HomePageController extends GetxController {
  bool animations = false;
  String? tranlatetext,
      fromLang = "Auto Detected",
      toCode,
      fromCode,
      toLang = "Arabic";
  List<LanguageCode> langCode = [];

  TextEditingController text = TextEditingController();
  @override
  void onInit() {
    animation();
    getlangcode();
    update();
    super.onInit();
  }

  animation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animations = true;
      update();
    });
  }

  getlangcode() async {
    String jsonString =
        await rootBundle.loadString('${Root.jsonData}/lang.json');
    LanguageData allahNameModel =
        LanguageData.fromJson(json.decode(jsonString));
    langCode = allahNameModel.languageCode!;
    update();
  }

  setting() => Get.to(() => const SettingPage(), transition: Transition.zoom);

  changelang(String? value, String? text) {
    text = "$value";
    update();
  }

  changeCode(String? value, String? text) {
    text = "$value";
    update();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller) {
          return Scaffold(
            body: BgDesign(
                page: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  AnimatedContainer(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 700),
                    transform: Matrix4.translationValues(
                        0, controller.animations ? 0 : Get.width, 0),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "App".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: Get.width / 12),
                        ),
                        ButtonDesing(
                            iconData: CupertinoIcons.gear_alt_fill,
                            onTap: () => controller.setting())
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 800),
                    transform: Matrix4.translationValues(
                        0, controller.animations ? 0 : Get.width, 0),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 3.5,
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme!
                                      .background)),
                          width: Get.width / 2.6,
                          height: 75,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              iconEnabledColor: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme!
                                  .background,
                              iconSize: 0,
                              borderRadius: BorderRadius.circular(25),
                              alignment: Alignment.center,
                              hint: Text(controller.fromLang!,
                                  style: TextStyle(
                                      fontSize: Get.width / 22,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold)),
                              onChanged: (value) => controller.changelang(
                                  value, controller.fromLang),
                              items: controller.langCode
                                  .map<DropdownMenuItem<String>>((value) =>
                                      DropdownMenuItem<String>(
                                          onTap: () => controller.changelang(
                                              value.code!, controller.fromCode),
                                          value: value.lang!,
                                          alignment: Alignment.center,
                                          child: Center(
                                            child: Text(value.lang!,
                                                style: TextStyle(
                                                    fontSize: Get.width / 22,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )))
                                  .toList(),
                            ),
                          ),
                        ),
                        ButtonDesing(
                            iconData: CupertinoIcons.arrow_right_arrow_left,
                            onTap: () => controller.setting()),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 3.5,
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme!
                                      .background)),
                          width: Get.width / 2.6,
                          height: 75,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              elevation: 0,
                              dropdownColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              isExpanded: true,
                              iconSize: 0,
                              borderRadius: BorderRadius.circular(25),
                              alignment: Alignment.center,
                              hint: Text(controller.toLang!,
                                  style: TextStyle(
                                      fontSize: Get.width / 22,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold)),
                              onChanged: (value) => controller.changelang(
                                  value, controller.toLang),
                              items: controller.langCode
                                  .map<DropdownMenuItem<String>>((value) =>
                                      DropdownMenuItem<String>(
                                          onTap: () => controller.changelang(
                                              value.code!, controller.toCode),
                                          value: value.lang!,
                                          alignment: Alignment.center,
                                          child: Center(
                                            child: Text(value.lang!,
                                                style: TextStyle(
                                                    fontSize: Get.width / 22,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )))
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 900),
                      transform: Matrix4.translationValues(
                          0, controller.animations ? 0 : Get.width, 0),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      width: 1.5,
                                      color: Theme.of(context)
                                          .buttonTheme
                                          .colorScheme!
                                          .background)),
                              child: CustomtextField(
                                  hint: "hint",
                                  textEditingController: controller.text),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Divider(
                                endIndent: 75,
                                indent: 75,
                                thickness: 1.2,
                                color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme!
                                    .background,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                  "datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: Get.width / 20)),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )),
          );
        });
  }
}
