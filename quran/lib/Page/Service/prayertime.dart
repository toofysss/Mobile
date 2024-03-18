import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quran/Page/Home/home.dart';
import 'package:quran/constant/root.dart';

class PrayerController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  get prayerTimes => homeController.prayerTimes;
  get currentpraypers => homeController.currentpraypers;
  String formattedTime = "";

  @override
  void onInit() {
    formattedTime = homeController.formattedTime.value;
    ever(homeController.formattedTime, (_) {
      formattedTime = homeController.formattedTime.value;
      update();
    });
    super.onInit();
  }
}

class PrayerTime extends StatelessWidget {
  const PrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayerController>(
        init: PrayerController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Text("S6".tr),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).appBarTheme.iconTheme!.color,
                  size: Root.iconsize - 3,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    width: Get.width * .9,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
                      border: Border.all(
                        width: 2.5,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(0, 0),
                          color: Theme.of(context).colorScheme.shadow,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "${controller.currentpraypers}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize:
                                    MediaQuery.of(context).size.width / 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Transform.rotate(
                          angle: -50,
                          child: Container(
                            height: 40,
                            width: 2.5,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          controller.formattedTime,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: MediaQuery.of(context).size.width / 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  PrayerTimeDesign(
                      iconData: CupertinoIcons.cloud_sun_fill,
                      title: "fjr".tr,
                      trailing:
                          DateFormat.jm().format(controller.prayerTimes.fajr),
                      selected:
                          controller.prayerTimes.currentPrayer().index == 0),
                  PrayerTimeDesign(
                      iconData: CupertinoIcons.sun_dust_fill,
                      title: "sunrise".tr,
                      trailing: DateFormat.jm()
                          .format(controller.prayerTimes.sunrise),
                      selected:
                          controller.prayerTimes.currentPrayer().index == 1),
                  PrayerTimeDesign(
                      iconData: CupertinoIcons.sun_min_fill,
                      title: "dhuhr".tr,
                      trailing:
                          DateFormat.jm().format(controller.prayerTimes.dhuhr),
                      selected:
                          controller.prayerTimes.currentPrayer().index == 2),
                  PrayerTimeDesign(
                      iconData: CupertinoIcons.sun_dust_fill,
                      title: "asr".tr,
                      trailing:
                          DateFormat.jm().format(controller.prayerTimes.asr),
                      selected:
                          controller.prayerTimes.currentPrayer().index == 3),
                  PrayerTimeDesign(
                      iconData: CupertinoIcons.sun_haze_fill,
                      title: "magrib".tr,
                      trailing: DateFormat.jm()
                          .format(controller.prayerTimes.maghrib),
                      selected:
                          controller.prayerTimes.currentPrayer().index == 4),
                  PrayerTimeDesign(
                      iconData: CupertinoIcons.moon_fill,
                      title: "isha".tr,
                      trailing:
                          DateFormat.jm().format(controller.prayerTimes.isha),
                      selected:
                          controller.prayerTimes.currentPrayer().index == 5),
                ],
              ),
            ),
          );
        });
  }
}

class PrayerTimeDesign extends StatelessWidget {
  final String title;
  final String trailing;
  final IconData iconData;
  final bool selected;
  const PrayerTimeDesign(
      {required this.iconData,
      required this.title,
      required this.trailing,
      required this.selected,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      selected: selected,
      leading: Icon(
        iconData,
        size: MediaQuery.of(context).size.width / 22,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width / 22,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: MediaQuery.of(context).size.width / 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
