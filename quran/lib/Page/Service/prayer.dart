import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/listcard.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("S4".tr),
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
        body: ListView.builder(
            itemCount: PrayerList.prayerList.length,
            itemBuilder: ((context, index) => ListCard(
                  title: Root.lang == "en"
                      ? PrayerList.prayerList[index].titleE!
                      : PrayerList.prayerList[index].titleA!,
                  dscrp: Root.lang == "en"
                      ? PrayerList.prayerList[index].dscrpE!
                      : PrayerList.prayerList[index].dscrpA!,
                ))));
  }
}
