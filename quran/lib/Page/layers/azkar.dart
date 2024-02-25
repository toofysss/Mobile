import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/azkardesign.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/controller/azkarcontroller.dart';
import 'package:quran/widget/custombackbutton.dart';
import 'package:quran/widget/customtext.dart';

class Azkar extends StatelessWidget {
  const Azkar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AzkarControllerImp>(
      init: AzkarControllerImp(),
      builder: (controller) {
      return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: CustomText(
                color: Theme.of(context).secondaryHeaderColor,
                size: Root.headersize,
                title: "S5".tr),
            centerTitle: true,
            leading: const CustomBackButtom(),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
                            title: "azkar$index".tr),
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
                        itemCount: AzkarList.morningList.length,
                        itemBuilder: (context, index) => AzkarDesign(
                              dscrp: Root.lang == "en"
                                  ? AzkarList.morningList[index].nameE!
                                  : AzkarList.morningList[index].nameA!,
                            )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.eveningList.length,
                        itemBuilder: (context, index) => AzkarDesign(
                              dscrp: Root.lang == "en"
                                  ? AzkarList.eveningList[index].nameE!
                                  : AzkarList.eveningList[index].nameA!,
                            )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.sleepList.length,
                        itemBuilder: (context, index) => AzkarDesign(
                              dscrp: Root.lang == "en"
                                  ? AzkarList.sleepList[index].nameE!
                                  : AzkarList.sleepList[index].nameA!,
                            )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.wakeupList.length,
                        itemBuilder: (context, index) => AzkarDesign(
                              dscrp: Root.lang == "en"
                                  ? AzkarList.wakeupList[index].nameE!
                                  : AzkarList.wakeupList[index].nameA!,
                            )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.salaList.length,
                        itemBuilder: (context, index) => AzkarDesign(
                              dscrp: Root.lang == "en"
                                  ? AzkarList.salaList[index].nameE!
                                  : AzkarList.salaList[index].nameA!,
                            )),
                  ],
                ),
              )
            ],
          ));
    });
  }
}
