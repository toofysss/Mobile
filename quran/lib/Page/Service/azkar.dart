import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/listcard.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("S5".tr),
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
      body: DefaultTabController(
          length: 5,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor:
                    Theme.of(context).primaryColor.withOpacity(.7),
                tabs: [
                  Tab(
                    text: "azkar0".tr,
                  ),
                  Tab(
                    text: "azkar1".tr,
                  ),
                  Tab(
                    text: "azkar2".tr,
                  ),
                  Tab(
                    text: "azkar3".tr,
                  ),
                  Tab(
                    text: "azkar4".tr,
                  ),
                ],
                labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Root.fontsize,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.morningList.length,
                        itemBuilder: (context, index) => ListCard(
                              dscrp: '',
                              title: Root.lang == "en"
                                  ? AzkarList.morningList[index].nameE!
                                  : AzkarList.morningList[index].nameA!,
                            )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.eveningList.length,
                        itemBuilder: (context, index) => ListCard(
                              dscrp: '',
                              title: Root.lang == "en"
                                  ? AzkarList.eveningList[index].nameE!
                                  : AzkarList.eveningList[index].nameA!,
                            )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.sleepList.length,
                        itemBuilder: (context, index) => ListCard(
                              dscrp: '',
                              title: Root.lang == "en"
                                  ? AzkarList.sleepList[index].nameE!
                                  : AzkarList.sleepList[index].nameA!,
                            )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.wakeupList.length,
                        itemBuilder: (context, index) => ListCard(
                              dscrp: '',
                              title: Root.lang == "en"
                                  ? AzkarList.wakeupList[index].nameE!
                                  : AzkarList.wakeupList[index].nameA!,
                            )),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AzkarList.salaList.length,
                        itemBuilder: (context, index) => ListCard(
                              dscrp: '',
                              title: Root.lang == "en"
                                  ? AzkarList.salaList[index].nameE!
                                  : AzkarList.salaList[index].nameA!,
                            )),
                  ]))
            ],
          )),
    );
  }
}
