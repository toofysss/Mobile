import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/controller/quranpage.dart';
import 'package:quran/widget/customtext.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuranControllerImp());

    return GetBuilder<QuranControllerImp>(builder: (controller) {
      return Column(
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => GestureDetector(
                  onTap: () => controller.changepage(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: index == controller.i
                          ? Theme.of(context).buttonTheme.colorScheme!.primary
                          : Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .primary
                              .withOpacity(.6),
                    ),
                    child: Center(
                      child: CustomText(
                          color: Colors.white,
                          size: Root.fontsize,
                          title: "${index + 1}".tr),
                    ),
                  ),
                ),
              )),
          Expanded(
              child: PageView(
            controller: controller.pageController,
            onPageChanged: (value) => controller.changepage(value),
            children: [
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ))
        ],
      );
    });
  }
}
