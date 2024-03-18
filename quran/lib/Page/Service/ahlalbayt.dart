import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class AhlAlbaytPage extends StatelessWidget {
  const AhlAlbaytPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text("S13".tr),
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
                    text: "Information0".tr,
                  ),
                  Tab(
                    text: "Information1".tr,
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
                        itemCount: AhlalbaitList.ahlAlBayt.length,
                        itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1.5,
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme!
                                      .primary),
                            ),
                            child: ListTile(
                                title: Center(
                                  child: Text(
                                    Root.lang == "en"
                                        ? AhlalbaitList.ahlAlBayt[index].nameE!
                                        : AhlalbaitList.ahlAlBayt[index].nameA!,
                                    style: TextStyle(
                                        fontSize: Root.fontsize,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "4".tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: Root.fontsize,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              Root.lang == "en"
                                                  ? AhlalbaitList
                                                      .ahlAlBayt[index].dateE!
                                                  : AhlalbaitList
                                                      .ahlAlBayt[index].dateA!,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: Root.fontsize,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "5".tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: Root.fontsize,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              Root.lang == "en"
                                                  ? AhlalbaitList
                                                      .ahlAlBayt[index]
                                                      .deadDateE!
                                                  : AhlalbaitList
                                                      .ahlAlBayt[index]
                                                      .deadDateA!,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: Root.fontsize,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )))),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: AhlalbaitList.maswomen.length,
                        itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1.5,
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme!
                                      .primary),
                            ),
                            child: ListTile(
                                title: Center(
                                  child: Text(
                                    Root.lang == "en"
                                        ? AhlalbaitList.ahlAlBayt[index].nameE!
                                        : AhlalbaitList.ahlAlBayt[index].nameA!,
                                    style: TextStyle(
                                        fontSize: Root.fontsize,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "4".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: Root.fontsize,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                Root.lang == "en"
                                                    ? AhlalbaitList
                                                        .ahlAlBayt[index].dateE!
                                                    : AhlalbaitList
                                                        .ahlAlBayt[index]
                                                        .dateA!,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: Root.fontsize,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "5".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: Root.fontsize,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                Root.lang == "en"
                                                    ? AhlalbaitList
                                                        .ahlAlBayt[index]
                                                        .deadDateE!
                                                    : AhlalbaitList
                                                        .ahlAlBayt[index]
                                                        .deadDateA!,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: Root.fontsize,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                )))),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
