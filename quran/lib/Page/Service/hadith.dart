import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/detailsdesign.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class HadithPage extends StatelessWidget {
  const HadithPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("S2".tr),
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
              crossAxisCount: 4,
              mainAxisExtent: 50,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15),
          itemCount: HadithList.hadithList.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => Get.to(
                    () => DetailsDesign(
                          dscrp: HadithList.hadithList[index].dscrp!,
                          title: "S2".tr,
                        ),
                    transition: Transition.fadeIn,
                    curve: Curves.fastOutSlowIn),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1.5,
                        color:
                            Theme.of(context).buttonTheme.colorScheme!.primary),
                  ),
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: Root.fontsize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
    );
  }
}
