import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/widget/custombackbutton.dart';
import 'package:quran/widget/customtext.dart';

class AllahName extends StatelessWidget {
  const AllahName({super.key});

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
            title: "S3".tr),
        centerTitle: true,
        leading: const CustomBackButtom(),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 65,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          itemCount: AllahNameList.allahNameList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(index % 2 == 0 ? 0 : 500),
                  bottomRight: Radius.circular(index % 2 == 0 ? 0 : 500),
                  topRight: Radius.circular(index % 2 == 0 ? 500 : 0),
                  bottomLeft: Radius.circular(index % 2 == 0 ? 500 : 0)),
              color: Theme.of(context).buttonTheme.colorScheme!.primary,
              border: Border.all(
                  width: 1.5,
                  color: Theme.of(context).buttonTheme.colorScheme!.primary),
            ),
            child: Center(
              child: CustomText(
                  color: Theme.of(context).primaryColor,
                  size: Root.fontsize,
                  title: Root.lang == "en"
                      ? AllahNameList.allahNameList[index].titleE!
                      : AllahNameList.allahNameList[index].titleA!),
            ),
          ),
        ),
      ),
    );
  }
}
