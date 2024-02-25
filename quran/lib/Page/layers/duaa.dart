import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/duaadesign.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/controller/duaacontroller.dart';
import 'package:quran/widget/custombackbutton.dart';
import 'package:quran/widget/customtext.dart';

class Duaa extends StatelessWidget {
  const Duaa({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DuaaControllerImp>(
      init: DuaaControllerImp(),
      builder: (controller) {
      return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: CustomText(
                color: Theme.of(context).secondaryHeaderColor,
                size: Root.headersize,
                title: "S1".tr),
            centerTitle: true,
            leading: const CustomBackButtom(),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => GestureDetector(
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
                            title: "Duaa$index".tr),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: (value) => controller.changepage(value),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: DuaaList.daysList.length,
                        itemBuilder: (context, index) => DuaaDesign(
                            dscrp: DuaaList.daysList[index].dscrp!,
                            title: DuaaList.daysList[index].title!)),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: DuaaList.duaaQuranList.length,
                        itemBuilder: (context, index) => DuaaDesign(
                            dscrp: DuaaList.duaaQuranList[index].dscrp!,
                            title: DuaaList.duaaQuranList[index].title!)),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: DuaaList.duaaList.length,
                        itemBuilder: (context, index) => DuaaDesign(
                            dscrp: DuaaList.duaaList[index].dscrp!,
                            title: DuaaList.duaaList[index].title!)),
                  ],
                ),
              )
            ],
          ));
    });
  }
}
