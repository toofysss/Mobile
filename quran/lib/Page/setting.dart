import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran/Page/Setting/sizepage.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/services/services.dart';

class SettingController extends GetxController {
  MyServices myServices = Get.find();
  String genderDays = "0";

  @override
  void onInit() {
    getgelender();
    getsize();
    getMode();

    super.onInit();
  }

  void getMode() {
    String? devicemode = myServices.sharedPreferences.getString("Mode");
    if (devicemode != null) {
      Root.themeMode = devicemode == "Mode"
          ? ThemeMode.system
          : devicemode == "on"
              ? ThemeMode.dark
              : ThemeMode.light;
      Root.mode = devicemode == "Mode"
          ? "Mode"
          : devicemode == "on"
              ? "on"
              : "off";
    } else {
      Root.themeMode = Root.themeMode == ThemeMode.system
          ? ThemeMode.system
          : Get.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light;
      Root.mode = Root.themeMode == ThemeMode.system
          ? "Mode"
          : Get.isDarkMode
              ? "on"
              : "off";
    }
  }

  void getsize() {
    double? size = myServices.sharedPreferences.getDouble("Size");
    if (size != null) Root.fontsize = size;
  }

  void getgelender() {
    String? genderdays = myServices.sharedPreferences.getString("genderDays");
    genderdays != null ? genderDays = genderdays : genderDays = "0";
  }

  void changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Root.lang = langcode;
    HijriCalendar.setLocal(Root.lang);
    Get.updateLocale(locale);
    update();
    Get.back();
  }

  void changeMode(ThemeMode langcode) {
    Root.themeMode = langcode;
    Root.mode = Root.themeMode == ThemeMode.system
        ? "Mode"
        : langcode == ThemeMode.dark
            ? "on"
            : "off";
    myServices.sharedPreferences.setString("Mode", Root.mode);
    Get.back();
    Get.forceAppUpdate();
  }

  void changegelender(String change) {
    genderDays = change;
    myServices.sharedPreferences.setString("genderDays", change);
    update();
    Get.back();
  }
}

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller) {
          return Stack(
            children: [
              Image.asset(
                Root.bg,
                width: Get.width,
                height: Get.height / 8,
                fit: BoxFit.fill,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Expanded(
                child: Container(
                  height: Get.height,
                  margin: const EdgeInsets.only(top: 60),
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(0, 0),
                        color: Theme.of(context).shadowColor,
                      )
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SettingDesign(
                            divider: true,
                            onTap: () => showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioListTile(
                                          title: Text(
                                            "ar".tr,
                                            style: TextStyle(
                                              fontSize: Root.fontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          value: "ar",
                                          groupValue: Root.lang,
                                          onChanged: (String? value) =>
                                              controller.changeLang("ar"),
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            "en".tr,
                                            style: TextStyle(
                                              fontSize: Root.fontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          value: "en",
                                          groupValue: Root.lang,
                                          onChanged: (value) =>
                                              controller.changeLang("en"),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                            subtitle: Root.lang == "en" ? "en".tr : "ar".tr,
                            title: "Setting1".tr),
                        SettingDesign(
                            divider: true,
                            onTap: () => showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioListTile(
                                          title: Text(
                                            "Mode".tr,
                                            style: TextStyle(
                                              fontSize: Root.fontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          value: "Mode",
                                          groupValue: Root.mode,
                                          onChanged: (String? value) =>
                                              controller
                                                  .changeMode(ThemeMode.system),
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            "on".tr,
                                            style: TextStyle(
                                              fontSize: Root.fontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          value: "on",
                                          groupValue: Root.mode,
                                          onChanged: (value) => controller
                                              .changeMode(ThemeMode.dark),
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            "off".tr,
                                            style: TextStyle(
                                              fontSize: Root.fontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          value: "off",
                                          groupValue: Root.mode,
                                          onChanged: (value) => controller
                                              .changeMode(ThemeMode.light),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                            subtitle: Root.mode.tr,
                            title: "Setting2".tr),
                        SettingDesign(
                            divider: true,
                            onTap: () => Get.to(() => const SizePage(),
                                transition: Transition.size),
                            subtitle: "${Root.fontsize.toInt()}",
                            title: "Setting3".tr),
                        SettingDesign(
                            onTap: () => showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioListTile(
                                          title: Text(
                                            "9".tr,
                                            style: TextStyle(
                                              fontSize: Root.fontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          value: "-1",
                                          groupValue: controller.genderDays,
                                          onChanged: (String? value) =>
                                              controller.changegelender("-1"),
                                        ),
                                        RadioListTile(
                                          title: Text(
                                            "10".tr,
                                            style: TextStyle(
                                              fontSize: Root.fontsize,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          value: "0",
                                          groupValue: controller.genderDays,
                                          onChanged: (value) =>
                                              controller.changegelender("0"),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                            subtitle:
                                controller.genderDays == "0" ? "10".tr : "9".tr,
                            title: "Setting4".tr,
                            divider: true),
                        SettingDesign(
                            divider: false,
                            onTap: () => DataClass.openData(
                                "https://mustafa--cv.web.app"),
                            subtitle: "",
                            title: "Contact".tr),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class SettingDesign extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;
  final bool divider;
  const SettingDesign(
      {required this.onTap,
      required this.subtitle,
      required this.title,
      required this.divider,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(5),
              child: Wrap(
                children: [
                  SizedBox(
                    width: Get.width / 2.2,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: Root.fontsize,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 2.3,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.end,
                      children: [
                        Visibility(
                          visible: subtitle.isNotEmpty,
                          child: Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: Root.fontsize,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color:
                                Theme.of(context).appBarTheme.iconTheme!.color,
                            size: Root.fontsize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
              visible: divider,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Theme.of(context).primaryColor.withOpacity(.4),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: .5,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).primaryColor.withOpacity(.4),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
