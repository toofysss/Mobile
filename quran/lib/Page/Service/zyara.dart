import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/listcard.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class ZyaraPage extends StatelessWidget {
  const ZyaraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("S7".tr),
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
          length: 2,
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
                    text: "Zyara0".tr,
                  ),
                  Tab(
                    text: "Zyara1".tr,
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
                        itemCount: ZyaraList.zyaraDayList.length,
                        itemBuilder: (context, index) => ListCard(
                            dscrp: Root.lang == "en"
                                ? ZyaraList.zyaraDayList[index].dscrpE!
                                : ZyaraList.zyaraDayList[index].dscrpA!,
                            title: Root.lang == "en"
                                ? ZyaraList.zyaraDayList[index].titleE!
                                : ZyaraList.zyaraDayList[index].titleA!)),
                                
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: ZyaraList.zyaraAnbiaaList.length,
                        itemBuilder: (context, index) => ListCard(
                            dscrp: Root.lang == "en"
                                ? ZyaraList.zyaraAnbiaaList[index].dscrpE!
                                : ZyaraList.zyaraAnbiaaList[index].dscrpA!,
                            title: Root.lang == "en"
                                ? ZyaraList.zyaraAnbiaaList[index].titleE!
                                : ZyaraList.zyaraAnbiaaList[index].titleA!)),
                  ]))
            ],
          )),
    );
  }
}
