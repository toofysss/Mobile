import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran/Page/Home/animatedtext.dart';
import 'package:quran/Page/Service/prayertime.dart';
import 'package:quran/Page/setting.dart';
import 'package:quran/constant/root.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:quran/Page/Service/ahlalbayt.dart';
import 'package:quran/Page/Service/alamalpage.dart';
import 'package:quran/Page/Service/allahname.dart';
import 'package:quran/Page/Service/azkar.dart';
import 'package:quran/Page/Service/calenderpage.dart';
import 'package:quran/Page/Service/duaa.dart';
import 'package:quran/Page/Service/guidelocation.dart';
import 'package:quran/Page/Service/hadith.dart';
import 'package:quran/Page/Service/monaja.dart';
import 'package:quran/Page/Service/prayer.dart';
import 'package:quran/Page/Service/qiblapage.dart';
import 'package:quran/Page/Service/salat.dart';
import 'package:quran/Page/Service/tasbehat.dart';
import 'package:quran/Page/Service/zyara.dart';

class HomeController extends GetxController {
  SettingController settingController = Get.put(SettingController());
  get day => int.parse(settingController.genderDays);

  Timer? timer;
  RxInt remainingSeconds = 0.obs;
  RxString formattedTime = "".obs;
  RxString currentpraypers = "".obs;
  Rx<DateTime> currentDateTime = DateTime.now().obs;
  DateTime? nextprayper;
  final prayerTimes = PrayerTimes.today(
      Coordinates(
        Root.latitude,
        Root.longitude,
      ),
      CalculationMethod.karachi.getParameters());

  @override
  void onInit() {
    super.onInit();
    currentPrayer(prayerTimes.currentPrayer().index);
    update();
    ever(currentDateTime, (_) {
      currentPrayer(prayerTimes.currentPrayer().index);
      update();
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingSeconds.value > 0 ? updateFormattedTime() : timer.cancel();
    });
  }

  void updateFormattedTime() {
    remainingSeconds--;
    int hours = remainingSeconds.value ~/ 3600;
    int minutes = (remainingSeconds.value % 3600) ~/ 60;
    int seconds = remainingSeconds.value % 60;
    formattedTime.value =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    update();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void currentPrayer(int index) {
    switch (index) {
      case 0:
        currentpraypers.value = "fjr".tr;
        nextprayper = prayerTimes.fajr;
        break;
      case 1:
        currentpraypers.value = "sunrise".tr;
        nextprayper = prayerTimes.sunrise;
        break;
      case 2:
        currentpraypers.value = "dhuhr".tr;
        nextprayper = prayerTimes.dhuhr;
        break;
      case 3:
        currentpraypers.value = "asr".tr;
        nextprayper = prayerTimes.asr;
        break;
      case 4:
        currentpraypers.value = "magrib".tr;
        nextprayper = prayerTimes.maghrib;
        break;
      case 5:
        currentpraypers.value = "isha".tr;
        nextprayper = prayerTimes.isha;
        break;
      default:
        currentpraypers.value = "fjr".tr;
        nextprayper = prayerTimes.fajr.add(const Duration(days: 1));
        break;
    }
    Duration nextPrayerTime = nextprayper!.difference(DateTime.now());
    nextPrayerTime = nextPrayerTime.abs();
    remainingSeconds.value = nextPrayerTime.inSeconds;
    startTimer();
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: Get.height / 3.5,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      Root.bg,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fit: BoxFit.fill,
                      height: double.maxFinite,
                      width: Get.width,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "${controller.currentpraypers.value}   ${DateFormat.jm().format(controller.nextprayper!)}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 19,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: Get.width * .8,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    HijriCalendar.fromDate(DateTime.now().add(
                                            Duration(days: controller.day)))
                                        .toFormat('dd MMMM'),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Transform.rotate(
                                  angle: -50,
                                  child: Container(
                                    height: 40,
                                    width: 2.5,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                Text(
                                  DateFormat('EEE d/MMM', Root.lang)
                                      .format(DateTime.now()),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(top: 15),
                padding: const EdgeInsets.only(bottom: 30, top: 15),
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
                child: Wrap(
                  children: [
                    CategorayDesign(
                        iconData: CupertinoIcons.clock_fill,
                        title: "S6".tr,
                        onTap: () => Get.to(() => const PrayerTime(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidPrayer,
                        title: "S1".tr,
                        onTap: () => Get.to(() => const DuaaPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidKowtow,
                        title: "S4".tr,
                        onTap: () => Get.to(() => const PrayerPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidMohammad,
                        title: "S17".tr,
                        onTap: () => Get.to(() => const SalatAnbiaaPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidAllah,
                        title: "S3".tr,
                        onTap: () => Get.to(() => const AllahNamePage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.quran,
                        title: "S2".tr,
                        onTap: () => Get.to(() => const HadithPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidMosque,
                        title: "S7".tr,
                        onTap: () => Get.to(() => const ZyaraPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidPrayingPerson,
                        title: "S5".tr,
                        onTap: () => Get.to(() => const AzkarPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidPrayingPerson,
                        title: "S8".tr,
                        onTap: () => Get.to(() => const MonajaPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidTasbih2,
                        title: "S9".tr,
                        onTap: () => Get.to(() => const TasbeehPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidLantern,
                        title: "S18".tr,
                        onTap: () => Get.to(() => const AlamalPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: CupertinoIcons.calendar_today,
                        title: "S11".tr,
                        onTap: () => Get.to(() => const ClaenderPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.solidQibla,
                        title: "S12".tr,
                        onTap: () => Get.to(() => const QiblaPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.locationMosque,
                        title: "S16".tr,
                        onTap: () => Get.to(() => const GuideLocationPage(),
                            transition: Transition.fadeIn)),
                    CategorayDesign(
                        iconData: FlutterIslamicIcons.mohammad,
                        title: "S13".tr,
                        onTap: () => Get.to(() => const AhlAlbaytPage(),
                            transition: Transition.fadeIn)),
                  ],
                ),
              ))
            ],
          );
        });
  }
}

class CategorayDesign extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function()? onTap;

  const CategorayDesign({
    required this.iconData,
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  Widget animtedtext() {
    if (title.split(" ").length > 2) {
      return SizedBox(
        height: 30,
        child: Marquee(
          text: title,
          accelerationDuration: const Duration(seconds: 2),
        ),
      );
    } else {
      return Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: MediaQuery.of(Get.context!).size.width / 26,
          color: Theme.of(Get.context!).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      width: Get.width / 4,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(0, 0),
                      color: Theme.of(context).colorScheme.shadow,
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Icon(
                  iconData,
                  size: MediaQuery.of(context).size.width / 14,
                  color: Theme.of(context).colorScheme.primary,
                )),
            animtedtext()
          ],
        ),
      ),
    );
  }
}
