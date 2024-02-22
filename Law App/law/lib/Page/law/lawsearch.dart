import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/law.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customflloatingsearch.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

// صفحة عرض المادة
class LawSearchController extends GetxController {
  TextEditingController search = TextEditingController();
}

class LawSearch extends StatelessWidget {
  final List<LawDetails> item;
  final String header;
  const LawSearch({required this.header, required this.item, super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LawSearchController>(
        init: LawSearchController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leading: const BackPageButton(),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // App Img Logo
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(Root.logo), fit: BoxFit.fill)),
                    ),
                    // Header Of Law
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Center(
                        child: CustomText(
                            color:
                                Theme.of(context).appBarTheme.foregroundColor!,
                            data: header,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip),
                      ),
                    ),
                    // Search For Law
                    Container(
                      width: Get.width * .9,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          controller: controller.search,
                          maxline: 1,
                          hints: "88".tr),
                    ),
                    // View Law By Count
                    Container(
                      width: Get.width * .8,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomButton(
                          data: "89".tr,
                          ontap: () async {
                            FocusScope.of(context).unfocus();

                            if (controller.search.text.isEmpty) {
                              return AlertClass.error("88".tr);
                            } else if (int.parse(controller.search.text) >
                                item.length) {
                              return AlertClass.error(
                                  "${'177'.tr} ${item.length} ${'178'.tr}");
                            }
                            Get.to(
                                () => Details(
                                      item: item,
                                      count: controller.search.text,
                                      title: header,
                                    ),
                                transition: Transition.fadeIn);
                          }),
                    ),
                    // view All Law
                    Container(
                      width: Get.width * .8,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomButton(
                          data: "90".tr,
                          ontap: () => Get.to(
                              () => FullLawDetails(
                                    item: item,
                                    title: header,
                                  ),
                              transition: Transition.fadeIn)),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// View Law By Count
class LawsDetailsController extends GetxController {
  String data = "";
  List<LawDetails> filteredDetails = [];
  void setData(Details contract) {
    if (data.isEmpty) {
      data = contract.count;
    }
    filteredDetails = contract.item
        .where((e) =>
            e.dscrp!.toLowerCase().contains("المادة ${data.toLowerCase()}"))
        .toList();
    update();
  }
}

class Details extends StatelessWidget {
  final List<LawDetails> item;
  final String count;
  final String title;
  const Details(
      {required this.title,
      required this.count,
      required this.item,
      super.key});
  @override
  Widget build(BuildContext context) {
    LawsDetailsController controller = Get.put(LawsDetailsController());
    controller.setData(this);
    return GetBuilder<LawsDetailsController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              centerTitle: true,
              title: CustomText(
                  color: Theme.of(context).appBarTheme.foregroundColor!,
                  data: title,
                  size: Root.textsize,
                  textOverflow: TextOverflow.ellipsis),
              leading: const BackPageButton(),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.filteredDetails.length,
                          itemBuilder: (context, index) {
                            var item = controller.filteredDetails[index];
                            return CustomCardLaw(
                                widget: CustomText(
                                    color: Theme.of(context).primaryColor,
                                    data: "${item.dscrp}",
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip));
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                                data: "179".tr,
                                ontap: () {
                                  if (controller.data == "1") return;
                                  int data2 = int.parse(controller.data) - 1;
                                  controller.data = "$data2";
                                  controller.setData(this);
                                  Get.appUpdate();
                                  Get.forceAppUpdate();
                                }),
                            CustomButton(
                                data: "180".tr,
                                ontap: () {
                                  if (int.parse(controller.data) ==
                                      item.length) {
                                    return;
                                  }

                                  int data2 = int.parse(controller.data) + 1;
                                  controller.data = "$data2";
                                  controller.setData(this);
                                  Get.appUpdate();
                                  Get.forceAppUpdate();
                                })
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * .8,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomButton(
                            data: "181".tr,
                            ontap: () => Get.to(
                                () => FullLawDetails(
                                      item: item,
                                      title: title,
                                    ),
                                transition: Transition.fadeIn)),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}

// View Full Law
class FullLawDetailsController extends GetxController {
  TextEditingController search = TextEditingController();
  List<LawDetails> filterdata = [];
  void setData(FullLawDetails contract) {
    filterdata = contract.item;
    update();
  }

  void searchdata(String text, FullLawDetails contract) {
    filterdata = contract.item
        .where((e) => e.dscrp!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    update();
  }
}

class FullLawDetails extends StatelessWidget {
  final List<LawDetails> item;
  final String title;
  const FullLawDetails({required this.title, required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    FullLawDetailsController controller = Get.put(FullLawDetailsController());
    controller.setData(this);
    return GetBuilder<FullLawDetailsController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leading: const BackPageButton(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
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
            body: SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.filterdata.length,
                            itemBuilder: (context, index) {
                              var item = controller.filterdata[index];
                              return CustomCardLaw(
                                widget: RichText(
                                  text: TextSpan(
                                    children: Data.highlightOccurrences(
                                        item.dscrp!, controller.search.text),
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: Root.textsize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            })
                      ],
                    ))),
          );
        });
  }
}
