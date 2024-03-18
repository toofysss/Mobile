import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Model/quranmodel.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Stack(
        children: [
          Image.asset(
            Root.bg,
            width: Get.width,
            height: Get.height / 9,
            fit: BoxFit.fill,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(0, 0),
                  color: Theme.of(context).shadowColor,
                )
              ],
            ),
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
                      text: "${1}".tr,
                    ),
                    Tab(
                      text: "${2}".tr,
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
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Wrap(
                          children: List.generate(
                              QuranList.quranList.length,
                              (index) => QuranDesign(
                                    data: QuranList.quranList[index].ayahs!,
                                    title: Root.lang == "en"
                                        ? QuranList
                                            .quranList[index].englishName!
                                        : QuranList.quranList[index].name!,
                                  ))),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(bottom: 50),
                        itemCount: QuranList.juzList.length,
                        itemBuilder: (context, index) {
                          var data = QuranList.juzList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "${Root.lang == "en" ? data.juzE : data.juzA}",
                                  style: TextStyle(
                                      fontSize: Root.fontsize,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Wrap(
                                  children: List.generate(
                                      data.data!.length,
                                      (index) => QuranDesign(
                                            data: data.data![index].ayahs!,
                                            title: Root.lang == "en"
                                                ? data.data![index].englishName!
                                                : data.data![index].name!,
                                          ))),
                            ],
                          );
                        }),
                  ],
                ))
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class QuranDesign extends StatelessWidget {
  final String title;
  final List<Ayahs> data;
  const QuranDesign({required this.data, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.to(
            () => QuranView(
                  data: data,
                  title: title,
                ),
            transition: Transition.fadeIn,
            curve: Curves.fastOutSlowIn),
        child: Container(
          width: Get.width / 2.4,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                  width: 1.5, color: Theme.of(context).colorScheme.primary)),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Root.fontsize,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ));
  }
}

class QuranView extends StatelessWidget {
  final List<Ayahs> data;
  final String title;
  const QuranView({required this.data, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          height: Get.width * .2,
                          width: Get.width * .7,
                          child: Image.asset(
                            Root.headerimg,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          alignment: Alignment.center,
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: Get.width / 16,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                            left: Root.lang == "en" ? 0 : null,
                            right: Root.lang == "en" ? null : 0,
                            top: 0,
                            child: GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                Root.lang == "en"
                                    ? Icons.arrow_forward_ios_rounded
                                    : Icons.arrow_back_ios_new_rounded,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .iconTheme!
                                    .color,
                                size: Root.iconsize - 3,
                              ),
                            ))
                      ],
                    ),
                  ),
                  RichText(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: data
                          .asMap()
                          .entries
                          .map(
                            (entry) => TextSpan(
                              children: [
                                TextSpan(
                                  text: "${entry.value.text!} ",
                                  style: TextStyle(
                                    fontSize: Root.fontsize,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Container(
                                    width: Root.fontsize + 10,
                                    height: Root.fontsize + 10,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 0),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          child: Image.asset(
                                            Root.surahnumber,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            "${entry.key + 1}",
                                            style: TextStyle(
                                              fontSize: Root.fontsize - 8,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
