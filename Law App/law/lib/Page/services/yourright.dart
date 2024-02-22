import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/yourright.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';

// حقوقك
class YourRightController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<Details> filteredDetails = [];

  void setData(YourRightDetails contract) {
    filteredDetails = contract.details;
    update();
  }

  void search(String text, YourRightDetails contract) {
    filteredDetails = contract.details
        .where((e) => e.question!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    update();
  }
}

class YourRight extends StatelessWidget {
  final List<YourRightDataClass> yourRightInstance;
  const YourRight({required this.yourRightInstance, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: CustomText(
                color: Theme.of(context).appBarTheme.foregroundColor!,
                data: "15".tr,
                size: Root.textsize,
                textOverflow: TextOverflow.clip),
            leading: const BackPageButton()),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 120,
              ),
              scrollDirection: Axis.vertical,
              itemCount: yourRightInstance.length,
              itemBuilder: (context, index) {
                var item = yourRightInstance[index];
                return GestureDetector(
                    onTap: () => Get.to(
                        () => YourRightDetails(
                            data: item.title!, details: item.details!),
                        transition: Transition.fadeIn),
                    child: CustomCardLaw(
                        widget: Center(
                      child: CustomText(
                          color: Theme.of(context).primaryColor,
                          data: "${item.title}",
                          size: Root.textsize,
                          textOverflow: TextOverflow.ellipsis),
                    )));
              },
            )));
  }
}

class YourRightDetails extends StatelessWidget {
  final String data;
  final List<Details> details;
  const YourRightDetails(
      {required this.data, required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    YourRightController controller = Get.put(YourRightController());
    controller.setData(this);
    return GetBuilder<YourRightController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leading: const BackPageButton(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: SizedBox(
                width: Get.width * (Data.isSearching ? 0.8 : 0.0),
                child: CustomTextSearch(
                    controller: controller.searchController,
                    hints: "44".tr,
                    onChanged: (text) => controller.search(text, this),
                    showsearch: Data.isSearching,
                    title: data),
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      Data.isSearching = !Data.isSearching;
                      Get.forceAppUpdate();
                    },
                    child: const CustomSearchButton()),
              ],
            ),
            body: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.filteredDetails.length,
              itemBuilder: (context, outerIndex) {
                var item = controller.filteredDetails[outerIndex];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ExpansionTile(
                    iconColor: Theme.of(context).primaryColor,
                    collapsedIconColor: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).indicatorColor,
                    textColor: Theme.of(context).primaryColor,
                    collapsedTextColor: Theme.of(context).primaryColor,
                    collapsedBackgroundColor: Theme.of(context).indicatorColor,
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title: CustomText(
                        color: Theme.of(context).primaryColor,
                        data: item.question!,
                        size: Root.textsize,
                        textOverflow: TextOverflow.clip),
                    children: [
                      ListTile(
                          title: CustomText(
                            color: Theme.of(context).primaryColor,
                            data: item.answer!,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip,
                          ),
                          trailing: Visibility(
                            visible: item.laws!.isNotEmpty,
                            child: GestureDetector(
                              onTap: () => AlertClass.showalert(
                                "",
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomText(
                                      color: Theme.of(context).indicatorColor,
                                      data: "${item.laws}",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip,
                                    ),
                                  ],
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Icon(
                                  FontAwesomeIcons.exclamation,
                                  size: Root.iconsSize,
                                  color: Theme.of(context).indicatorColor,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
