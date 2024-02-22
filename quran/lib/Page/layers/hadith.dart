import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/hadithdesign.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/widget/custombackbutton.dart';
import 'package:quran/widget/customtext.dart';

class Hadith extends StatelessWidget {
  const Hadith({super.key});

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
            title: "S2".tr),
        centerTitle: true,
        leading: const CustomBackButtom(),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 50,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          itemCount: HadithList.hadithList.length,
          itemBuilder: (context, index) => HadithDesign(
              dscrp: HadithList.hadithList[index].dscrp!,
              title: "${index + 1}")),
    );
  }
}
