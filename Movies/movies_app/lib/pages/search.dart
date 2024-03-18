import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:movies_app/Data/api.dart';
import 'package:movies_app/Data/search.dart';
import 'package:movies_app/Design/gridcard.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/widget/customloading.dart';
import 'package:movies_app/widget/customtext.dart';
import 'package:movies_app/widget/customtextfield.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextField(
              hints: '10'.tr,
              textInputType: TextInputType.name,
              iconData: Icons.search,
              readonly: false,
              controller: SearchClass.search,
              ontap: () {
                setState(() {});
              },
            ),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  elevation: 0,
                  enableDrag: false,
                  backgroundColor: Root.appbg,
                  context: context,
                  builder: (context) {
                    return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              height: 500,
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                border: Border.all(
                                    color: Colors.white.withOpacity(.13)),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(.06),
                                    Colors.white.withOpacity(.05),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: CustomText(
                                            colors: Root.textcolor,
                                            textOverflow: TextOverflow.clip,
                                            data: "11".tr,
                                            size: Root.textsize),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              SearchClass.clear();
                                            });
                                          },
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                      sigmaX: 13, sigmaY: 13),
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical: 15),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      border: Border.all(
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  .13)),
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Colors.white
                                                              .withOpacity(.06),
                                                          Colors.white
                                                              .withOpacity(.05),
                                                        ],
                                                      ),
                                                    ),
                                                    child: CustomText(
                                                      colors: Root.textcolor,
                                                      data: "12".tr,
                                                      size: Root.textsize - 5,
                                                      textOverflow:
                                                          TextOverflow.clip,
                                                    ),
                                                  )))),
                                    ],
                                  ),
                                  // select Section
                                  Container(
                                    width: Get.width,
                                    margin: const EdgeInsets.only(
                                        top: 18, left: 10, right: 10),
                                    child: ListTile(
                                      title: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: CustomText(
                                            textOverflow: TextOverflow.ellipsis,
                                            colors: Root.textcolor,
                                            data: '14'.tr,
                                            size: Root.textsize),
                                      ),
                                      subtitle: Material(
                                        elevation: 6,
                                        shadowColor: Root.appbg,
                                        borderRadius: BorderRadius.circular(30),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            iconEnabledColor: Root.appbg,
                                            iconDisabledColor: Root.appbg,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            alignment: Alignment.center,
                                            hint: CustomText(
                                              colors: Root.appbg,
                                              data: SearchClass.sectionid,
                                              size: Get.width / 26,
                                              textOverflow: TextOverflow.clip,
                                            ),
                                            onChanged: (value) {
                                              setState(() {
                                                SearchClass.sectionid = value!;
                                                Get.forceAppUpdate();
                                              });
                                            },
                                            items: SearchClass.dropdownsection
                                                .map<DropdownMenuItem<String>>(
                                                    (value) => DropdownMenuItem<
                                                            String>(
                                                        onTap: () {
                                                          SearchClass.secation
                                                                  .text =
                                                              "${value.value}";
                                                          Get.forceAppUpdate();
                                                        },
                                                        value: value.label,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Center(
                                                          child: CustomText(
                                                            colors: Root.appbg,
                                                            data: value.label,
                                                            size:
                                                                Get.width / 26,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .clip,
                                                          ),
                                                        )))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //  From Date
                                      SizedBox(
                                          height: 100,
                                          width: Get.width / 3,
                                          child: CupertinoPicker(
                                            itemExtent: 50,
                                            onSelectedItemChanged: (index) {
                                              setState(() {
                                                SearchClass.selectedYearfrom =
                                                    1900 + index;
                                              });
                                            },
                                            children: List.generate(
                                                DateTime.now().year - 1899,
                                                (index) {
                                              return Center(
                                                  child: CustomText(
                                                      colors: Root.textcolor,
                                                      data: '${1900 + index}',
                                                      size: Root.textsize,
                                                      textOverflow:
                                                          TextOverflow.clip));
                                            }),
                                          )),
                                      //
                                      CustomText(
                                          colors: Colors.white,
                                          data: "13".tr,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip),
                                      // To Date
                                      SizedBox(
                                          height: 100,
                                          width: Get.width / 3,
                                          child: CupertinoPicker(
                                            itemExtent: 50,
                                            onSelectedItemChanged: (index) {
                                              setState(() {
                                                SearchClass.selectedYearfrom =
                                                    1900 + index;
                                              });
                                            },
                                            children: List.generate(
                                                DateTime.now().year - 1899,
                                                (index) {
                                              return Center(
                                                  child: CustomText(
                                                      colors: Root.textcolor,
                                                      data:
                                                          '${DateTime.now().year - index}',
                                                      size: Root.textsize,
                                                      textOverflow:
                                                          TextOverflow.clip));
                                            }),
                                          )),
                                    ],
                                  ),

                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          // SearchClass.searchData(
                                          //     SearchClass.search.text,
                                          //     SearchClass.year.text,
                                          //     SearchClass.secation.text);
                                        });
                                      },
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 13, sigmaY: 13),
                                              child: Container(
                                                width: Get.width * 0.8,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 15),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 50),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color:
                                                      Root.colorSeclectBottom,
                                                ),
                                                child: Center(
                                                  child: CustomText(
                                                    colors: Root.textcolor,
                                                    data: "15".tr,
                                                    size: Root.textsize,
                                                    textOverflow:
                                                        TextOverflow.clip,
                                                  ),
                                                ),
                                              )))),
                                ],
                              ),
                            )));
                  }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(.13)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Root.appbg.withOpacity(.90),
                      Root.appbg.withOpacity(.90),
                    ],
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.sliders,
                  size: Root.iconsize + 5,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Visibility(
            visible: SearchClass.search.text.isEmpty, child: Container()),
        Visibility(
          visible: SearchClass.search.text.isNotEmpty,
          child: Expanded(
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TabBar(
                          indicatorColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          dividerColor: Colors.transparent,
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.transparent),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Root.colorSeclectBottom,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          tabs: [
                            Tab(
                              child: CustomText(
                                  colors: Colors.white,
                                  data: "8".tr,
                                  size: Root.textsize,
                                  textOverflow: TextOverflow.clip),
                            ),
                            Tab(
                              child: CustomText(
                                  colors: Colors.white,
                                  data: "9".tr,
                                  size: Root.textsize,
                                  textOverflow: TextOverflow.clip),
                            ),
                          ]),
                    ),
                    Expanded(
                        child: TabBarView(children: [
                      FutureBuilder(
                          future: SearchClass.searchData(
                              "/search/movie?query=${SearchClass.search.text}&year=${SearchClass.year.text}&api_key=${Api.apikey}&with_genres=${SearchClass.secation.text}"),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return GridCard(
                                item: snapshot.data['results'],
                                type: 'movie',
                              );
                            }
                            return const CustomLoading();
                          }),
                      FutureBuilder(
                          future: SearchClass.searchData(
                              "/search/tv?query=${SearchClass.search.text}&year=${SearchClass.year.text}&api_key=${Api.apikey}&with_genres=${SearchClass.secation.text}"),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return GridCard(
                                item: snapshot.data['results'],
                                type: 'tv',
                              );
                            }
                            return const CustomLoading();
                          }),
                    ]))
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
