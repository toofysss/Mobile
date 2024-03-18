import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class GuideLocationPage extends StatelessWidget {
  const GuideLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text("S16".tr),
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
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor:
                      Theme.of(context).primaryColor.withOpacity(.7),
                  tabs: [
                    Tab(
                      text: "Guide0".tr,
                    ),
                    Tab(
                      text: "Guide1".tr,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          itemCount: GuideInfoList.almaraqidList.length,
                          itemBuilder: (context, index) {
                            var space = (Geolocator.distanceBetween(
                                        Root.latitude,
                                        Root.longitude,
                                        GuideInfoList.almaraqidList[index].lat!,
                                        GuideInfoList
                                            .almaraqidList[index].long!) /
                                    1000)
                                .toStringAsFixed(1);
                            return GestureDetector(
                              onTap: () => DataClass.openData(
                                  "https://www.google.com/maps/search/?api=1&query=${GuideInfoList.almaraqidList[index].lat!},${GuideInfoList.almaraqidList[index].long!}"),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          width: 1.5,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  leading: Icon(
                                    FlutterIslamicIcons.solidMosque,
                                    size: Root.iconsize + 9,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  title: Text(
                                    Root.lang == "en"
                                        ? GuideInfoList
                                            .almaraqidList[index].nameE!
                                        : GuideInfoList
                                            .almaraqidList[index].nameA!,
                                    style: TextStyle(
                                        fontSize: Root.fontsize,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text("$space ${"11".tr}",
                                      style: TextStyle(
                                          fontSize: Root.fontsize,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                    Root.lang == "en"
                                        ? GuideInfoList
                                            .almaraqidList[index].locE!
                                        : GuideInfoList
                                            .almaraqidList[index].locA!,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: Root.fontsize,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          itemCount: GuideInfoList.almaqamatList.length,
                          itemBuilder: (context, index) {
                            var space = (Geolocator.distanceBetween(
                                        Root.latitude,
                                        Root.longitude,
                                        GuideInfoList.almaraqidList[index].lat!,
                                        GuideInfoList
                                            .almaraqidList[index].long!) /
                                    1000)
                                .toStringAsFixed(1);
                            return GestureDetector(
                              onTap: () => DataClass.openData(
                                  "https://www.google.com/maps/search/?api=1&query=${GuideInfoList.almaqamatList[index].lat},${GuideInfoList.almaqamatList[index].long}"),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          width: 1.5,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                                  leading: Icon(
                                    FlutterIslamicIcons.solidMosque,
                                    size: Root.iconsize + 9,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  title: Text(
                                    Root.lang == "en"
                                        ? GuideInfoList
                                            .almaqamatList[index].nameE!
                                        : GuideInfoList
                                            .almaqamatList[index].nameA!,
                                    style: TextStyle(
                                        fontSize: Root.fontsize,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text("$space ${"11".tr}",
                                      style: TextStyle(
                                          fontSize: Root.fontsize,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(
                                    Root.lang == "en"
                                        ? GuideInfoList
                                            .almaqamatList[index].locE!
                                        : GuideInfoList
                                            .almaqamatList[index].locA!,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: Root.fontsize,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ]))
              ],
            )));
  }
}
