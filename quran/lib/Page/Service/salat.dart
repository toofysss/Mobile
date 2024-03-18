import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/listcard.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class SalatAnbiaaPage extends StatelessWidget {
  const SalatAnbiaaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text("S17".tr),
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
            itemCount: SalatAnbiaaList.salatAnbiaaList.length,
            itemBuilder: (context, index) => ListCard(
                title: Root.lang == "en"
                    ? SalatAnbiaaList.salatAnbiaaList[index].titleE!
                    : SalatAnbiaaList.salatAnbiaaList[index].titleA!,
                dscrp: Root.lang == "en"
                    ? SalatAnbiaaList.salatAnbiaaList[index].dscrpE!
                    : SalatAnbiaaList.salatAnbiaaList[index].dscrpA!)));
  }
}
