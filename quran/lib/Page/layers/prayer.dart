import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/payrerdesign.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/widget/custombackbutton.dart';
import 'package:quran/widget/customtext.dart';

class Prayer extends StatelessWidget {
  const Prayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomText(
              color: Theme.of(context).secondaryHeaderColor,
              size: Root.headersize,
              title: "S4".tr),
          centerTitle: true,
          leading: const CustomBackButtom(),
        ),
        body: ListView.builder(
            itemCount: PrayerList.prayerList.length,
            itemBuilder: (context, index) => ParyerDesign(
                dscrp: Root.lang == "en"
                    ? PrayerList.prayerList[index].dscrpE!
                    : PrayerList.prayerList[index].dscrpA!,
                title: Root.lang == "en"
                    ? PrayerList.prayerList[index].titleE!
                    : PrayerList.prayerList[index].titleA!)));
  }
}
