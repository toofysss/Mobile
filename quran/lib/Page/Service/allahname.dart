import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class AllahNamePage extends StatelessWidget {
  const AllahNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("S3".tr),
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
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 65,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15),
        itemCount: AllahNameList.allahNameList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 1.5,
                color: Theme.of(context).buttonTheme.colorScheme!.primary),
          ),
          child: Center(
            child: Text(
              Root.lang == "en"
                  ? AllahNameList.allahNameList[index].titleE!
                  : AllahNameList.allahNameList[index].titleA!,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Get.width / 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
