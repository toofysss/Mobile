import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/listcard.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';


class DuaaPage extends StatelessWidget {
  const DuaaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("S1".tr),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: Root.iconsize - 3,
          ),
        ),
      ),
      body: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                unselectedLabelColor:
                    Theme.of(context).primaryColor.withOpacity(.7),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: "Duaa0".tr,
                  ),
                  Tab(
                    text: "Duaa1".tr,
                  ),
                  Tab(
                    text: "Duaa2".tr,
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
                        itemCount: DuaaList.daysList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListCard(
                            dscrp: Root.lang == "en"
                                ? DuaaList.daysList[index].dscrpE!
                                : DuaaList.daysList[index].dscrpA!,
                            title: Root.lang == "en"
                                ? DuaaList.daysList[index].titleE!
                                : DuaaList.daysList[index].titleA!)),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: DuaaList.duaaQuranList.length,
                        itemBuilder: (context, index) => ListCard(
                            dscrp: Root.lang == "en"
                                ? DuaaList.duaaQuranList[index].dscrpE!
                                : DuaaList.duaaQuranList[index].dscrpA!,
                            title: Root.lang == "en"
                                ? DuaaList.duaaQuranList[index].titleE!
                                : DuaaList.duaaQuranList[index].titleA!)),
                    ListView.builder(
                        itemCount: DuaaList.duaaList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListCard(
                            dscrp: DuaaList.duaaList[index].dscrp!,
                            title: DuaaList.duaaList[index].title!)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
