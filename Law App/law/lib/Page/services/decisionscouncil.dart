import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/decisionscouncilministers.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';

class DecisionsCouncilMinistersController extends GetxController {
  List<DecisionsClass> filteredDetails = [];
  TextEditingController searchController = TextEditingController();
  void setData(DecisionsCouncilMinisters contract) {
    filteredDetails = contract.data;
    update();
  }

  void search(String text, DecisionsCouncilMinisters contract) {
    filteredDetails = contract.data
        .where((e) => e.dscrp!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    update();
  }
}

class DecisionsCouncilMinisters extends StatelessWidget {
  final List<DecisionsClass> data;
  final String title;
  const DecisionsCouncilMinisters(
      {required this.data, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    DecisionsCouncilMinistersController controller =
        Get.put(DecisionsCouncilMinistersController());
    controller.setData(this);
    return GetBuilder<DecisionsCouncilMinistersController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leading: const BackPageButton(),
              backgroundColor: Colors.transparent,
              elevation: 0,
             title: SizedBox(
                width: Get.width * (Data.isSearching ? 0.8 : 0.0),
                child: CustomTextSearch(
                    controller: controller.searchController,
                    hints: "44".tr,
                    onChanged: (text) => controller.search(text, this),
                    showsearch: Data.isSearching,
                    title: title),
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
              itemCount: controller.filteredDetails.length,
              itemBuilder: (context, index) {
                var item = controller.filteredDetails[index];
                return CustomCardLaw(
                  widget: Center(
                    child: SelectableText.rich(
                      TextSpan(
                        children: Data.highlightOccurrences(
                            "${item.dscrp}", controller.searchController.text),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Root.textsize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
}
