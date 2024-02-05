import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/law.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customflloatingsearch.dart';
import 'package:law/widget/customtext.dart';

// البحث الشامل
class Search extends StatefulWidget {
  final List<LawsData> item;
  const Search({required this.item, super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search = TextEditingController();
  List<LawsData> filterdata = [];
  @override
  void initState() {
    super.initState();
    search.clear();
    filterdata = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackPageButton(),
          actions: [
            Flexible(
              child: CustomFloatingSearch(
                controller: search,
                hint: "44".tr,
                onchnage: (text) {
                  setState(() {
                    filterdata = widget.item
                        .where((e) => e.details!.any((detail) => detail.dscrp!
                            .toLowerCase()
                            .contains(search.text.toLowerCase())))
                        .toList();
                  });
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            color: Root.backgroundApp,
            child: Directionality(
              textDirection: LanguageClass.lang.text == "English"
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                            visible: search.text.isNotEmpty,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: filterdata.length,
                                itemBuilder: (context, index) {
                                  var item = filterdata[index];
                                  var matchingDetails = item.details!
                                      .where((detail) => detail.dscrp!
                                          .toLowerCase()
                                          .contains(search.text.toLowerCase()))
                                      .toList();
                                  return Visibility(
                                      visible: matchingDetails.isNotEmpty,
                                      child: Column(
                                        children: [
                                          for (var detail in matchingDetails)
                                            CustomCardLaw(
                                              widget: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 15,
                                                        horizontal: 15),
                                                    child: CustomText(
                                                      color: Root.secondry,
                                                      data: item.dscrp!,
                                                      size: Root.textsize,
                                                      textOverflow:
                                                          TextOverflow.clip,
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: RichText(
                                                      text: TextSpan(
                                                        children: Data
                                                            .highlightOccurrences(
                                                          detail.dscrp ?? "",
                                                          search.text,
                                                        ),
                                                        style: TextStyle(
                                                          color: Root.secondry,
                                                          fontSize:
                                                              Root.textsize,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                        ],
                                      ));
                                },
                              ),
                            )),
                        Visibility(
                          visible: search.text.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 70),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: CustomText(
                                        color: Root.primary,
                                        data: "95".tr,
                                        size: Root.headersize + 2,
                                        textOverflow: TextOverflow.clip),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 25),
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: DecorationImage(
                                            image: AssetImage(Root.loadimg),
                                            fit: BoxFit.fill)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
