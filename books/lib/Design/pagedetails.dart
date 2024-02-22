import 'dart:convert';

import 'package:books/class/searchingdata.dart';
import 'package:books/constant/data.dart';
import 'package:books/constant/root.dart';
import 'package:books/services/services.dart';
import 'package:books/widget/customimage.dart';
import 'package:books/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageDetials extends StatelessWidget {
  final Items data;
  const PageDetials({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Get.back();
                FocusScope.of(Get.context!).unfocus();
              },
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: Root.iconsize + 2,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
          body: Directionality(
            textDirection:
                Root.lang == "en" ? TextDirection.ltr : TextDirection.rtl,
            child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: Get.height * .7,
                      width: Get.width,
                      padding: const EdgeInsets.only(top: 15),
                      decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.secondary,

                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45)),
                        border: Border.all(color: Theme.of(context).cardColor),
                      ),
                      child: DefaultTabController(
                          length: 2,
                          child: Column(
                            children: [
                              TabBar(
                                  overlayColor:
                                      MaterialStateProperty.resolveWith(
                                          (states) => Colors.transparent),
                                  dividerColor: Colors.transparent,
                                  indicatorColor:
                                      Theme.of(context).indicatorColor,
                                  splashFactory: NoSplash.splashFactory,
                                  indicatorWeight: 4,
                                  tabs: [
                                    Tab(
                                      child: CustomText(
                                        data: "7".tr,
                                        size: Root.fontsize + 5,
                                        color: Theme.of(context).focusColor,
                                      ),
                                    ),
                                    Tab(
                                      child: CustomText(
                                        data: "6".tr,
                                        size: Root.fontsize + 5,
                                        color: Theme.of(context).focusColor,
                                      ),
                                    ),
                                  ]),
                              Expanded(
                                  child: TabBarView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                    Visibility(
                                      visible:
                                          data.volumeInfo!.description != null,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // About
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            child: CustomText(
                                                color: Theme.of(context)
                                                    .focusColor,
                                                size: Root.fontsize + 8,
                                                data: "5".tr),
                                          ),
                                          // Dscrp
                                          Container(
                                            padding: const EdgeInsets.all(15),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: Get.height * .48,
                                            child: SingleChildScrollView(
                                              child: CustomText(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  size: Root.fontsize + 8,
                                                  data:
                                                      "${data.volumeInfo!.description}"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 15),
                                      child: Column(
                                        children: [
                                          // Page Count
                                          Visibility(
                                            visible:
                                                data.volumeInfo!.pagecount !=
                                                    null,
                                            child: ListTile(
                                              title: CustomText(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  size: Root.fontsize + 5,
                                                  data: "8".tr),
                                              subtitle: Directionality(
                                                textDirection: Root.lang == "en"
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                                child: CustomText(
                                                    color: ThemeDataClass.grey,
                                                    size: Root.fontsize,
                                                    data:
                                                        "${data.volumeInfo!.pagecount}"),
                                              ),
                                            ),
                                          ),
                                          // Publish Data
                                          Visibility(
                                            visible: data.volumeInfo!
                                                    .publishedDate !=
                                                null,
                                            child: ListTile(
                                              title: CustomText(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  size: Root.fontsize + 5,
                                                  data: "9".tr),
                                              subtitle: Directionality(
                                                textDirection: Root.lang == "en"
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                                child: CustomText(
                                                    color: ThemeDataClass.grey,
                                                    size: Root.fontsize,
                                                    data:
                                                        "${data.volumeInfo!.publishedDate}"),
                                              ),
                                            ),
                                          ),
                                          // Authors
                                          Visibility(
                                            visible: data.volumeInfo!.authors !=
                                                null,
                                            child: ListTile(
                                              title: CustomText(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  size: Root.fontsize + 5,
                                                  data: "10".tr),
                                              subtitle: Directionality(
                                                textDirection: Root.lang == "en"
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                                child: CustomText(
                                                    color: ThemeDataClass.grey,
                                                    size: Root.fontsize,
                                                    data: data.volumeInfo!
                                                                .authors !=
                                                            null
                                                        ? (data.volumeInfo
                                                                        ?.authors !=
                                                                    null &&
                                                                data
                                                                    .volumeInfo!
                                                                    .authors!
                                                                    .isNotEmpty
                                                            ? data.volumeInfo!
                                                                .authors!
                                                                .join(', ')
                                                            : '')
                                                        : ''),
                                              ),
                                            ),
                                          ),
                                          //  lang
                                          Visibility(
                                            visible:
                                                data.volumeInfo!.language !=
                                                    null,
                                            child: ListTile(
                                              title: CustomText(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  size: Root.fontsize + 5,
                                                  data: "11".tr),
                                              subtitle: Directionality(
                                                textDirection: Root.lang == "en"
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                                child: CustomText(
                                                    color: ThemeDataClass.grey,
                                                    size: Root.fontsize,
                                                    data:
                                                        "${data.volumeInfo!.language}"),
                                              ),
                                            ),
                                          ),
                                          // Section
                                          Visibility(
                                            visible:
                                                data.volumeInfo!.categories !=
                                                    null,
                                            child: ListTile(
                                              title: CustomText(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  size: Root.fontsize + 5,
                                                  data: "12".tr),
                                              subtitle: Directionality(
                                                textDirection: Root.lang == "en"
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                                child: CustomText(
                                                    color: ThemeDataClass.grey,
                                                    size: Root.fontsize,
                                                    data: data.volumeInfo!
                                                                .categories !=
                                                            null
                                                        ? (data.volumeInfo
                                                                        ?.categories !=
                                                                    null &&
                                                                data
                                                                    .volumeInfo!
                                                                    .categories!
                                                                    .isNotEmpty
                                                            ? data.volumeInfo!
                                                                .categories!
                                                                .join(', ')
                                                            : '')
                                                        : ''),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ])),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => DataClass.views(
                                          "${data.volumeInfo!.infoLink}"),
                                      child: Container(
                                          height: 50,
                                          width: Get.width * .45,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .indicatorColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      Root.lang == "en"
                                                          ? 0
                                                          : 45),
                                                  topRight: Radius.circular(
                                                      Root.lang == "en"
                                                          ? 45
                                                          : 0))),
                                          child: CustomText(
                                              color:
                                                  Theme.of(context)
                                                  .primaryColor,
                                              size: Root.fontsize + 3,
                                              data: "13".tr)),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        DataClass.favourite.any(
                                                (item) => item.id == data.id)
                                            ? DataClass.favourite.removeWhere(
                                                (item) => item.id == data.id)
                                            : DataClass.favourite.add(data);
                                        MyServices myServices = Get.find();

                                        List<String> favoritesJsonList =
                                            DataClass.favourite
                                                .map((item) =>
                                                    json.encode(item.toJson()))
                                                .toList();

                                        myServices.sharedPreferences
                                            .setStringList(
                                                "Favourite", favoritesJsonList);
                                        Get.forceAppUpdate();
                                      },
                                      child: SizedBox(
                                        width: Get.width * .2,
                                        child: Center(
                                          child: Icon(
                                            DataClass.favourite.any((item) =>
                                                    item.id == data.id)
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: Root.iconsize + 5,
                                            color: const Color(0xfffa2f31),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                  // image + title
                  Positioned(
                      bottom: Get.height * .686,
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomImage(
                              hieght: 170,
                              width: 140,
                              image:
                                  "${data.volumeInfo?.imageLinks?.thumbnail}"),
                          Column(
                            children: [
                              SizedBox(
                                width: 170,
                                child: RichText(
                                  maxLines: 3,
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context).focusColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "${data.volumeInfo?.title}\n",
                                        style: TextStyle(
                                            fontSize: 15.5,
                                            color: Theme.of(context).focusColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                          text: (data.volumeInfo!.authors !=
                                                  null)
                                              ? (data.volumeInfo?.authors !=
                                                          null &&
                                                      data.volumeInfo!.authors!
                                                          .isNotEmpty
                                                  ? data.volumeInfo!.authors!
                                                      .join(', ')
                                                  : '')
                                              : '',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: ThemeDataClass.grey,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
