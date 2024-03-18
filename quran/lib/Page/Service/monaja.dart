import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/listcard.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class MonajaPage extends StatelessWidget {
  const MonajaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text("S8".tr),
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
            itemCount: MonajaList.monajaList.length,
            itemBuilder: (context, index) => ListCard(
                title: Root.lang == "en"
                    ? MonajaList.monajaList[index].titleE!
                    : MonajaList.monajaList[index].titleA!,
                dscrp: Root.lang == "en"
                    ? MonajaList.monajaList[index].nameE!
                    : MonajaList.monajaList[index].nameA!)));
  }
}
