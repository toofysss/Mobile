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
class SearchController extends GetxController {
  TextEditingController search = TextEditingController();
  List<LawsData> filterdata = [];
  void setData(Search contract) {
    filterdata = contract.item;
    update();
  }

  void searchdata(String text, Search contract) {
    filterdata = contract.item
        .where((e) => e.dscrp!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    Get.forceAppUpdate();
    update();
  }
}

class Search extends StatelessWidget {
  final List<LawsData> item;
  const Search({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    SearchController controller = Get.put(SearchController());
    controller.setData(this);
    return GetBuilder<SearchController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const BackPageButton(),
              actions: [
                Flexible(
                  child: CustomFloatingSearch(
                    controller: controller.search,
                    hint: "44".tr,
                    onchnage: (text) => controller.searchdata(text, this),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Container(
                width: Get.width,
                height: Get.height,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: controller.search.text.isNotEmpty,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.filterdata.length,
                              itemBuilder: (context, index) {
                                var item = controller.filterdata[index];
                                var matchingDetails = item.details!
                                    .where((detail) => detail.dscrp!
                                        .toLowerCase()
                                        .contains(controller.search.text
                                            .toLowerCase()))
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
                                                    color: Theme.of(context)
                                                        .primaryColor,
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
                                                        controller.search.text,
                                                      ),
                                                      style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        fontSize: Root.textsize,
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
                          ),
                          Visibility(
                            visible: controller.search.text.isEmpty,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 70),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: CustomText(
                                          color: Theme.of(context)
                                              .appBarTheme
                                              .foregroundColor!,
                                          data: "95".tr,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 25),
                                      width: 250,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
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
          );
        });
  }
}
