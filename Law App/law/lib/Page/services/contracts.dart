import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/Page/contract/viewcontract.dart';
import 'package:law/class/contract.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';

class ContractSelect extends StatelessWidget {
  final List<ContractData> data;
  final String title;
  const ContractSelect({super.key, required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: const BackPageButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CustomText(
              color: Theme.of(context).appBarTheme.foregroundColor!,
              data: title,
              size: Root.textsize,
              textOverflow: TextOverflow.ellipsis)),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => Get.to(
                      () => Contract(data: data, title: "109".tr),
                      transition: Transition.fadeIn),
                  child: CustomCardLaw(
                      widget: Center(
                          child: CustomText(
                              color: Theme.of(context).primaryColor,
                              data: "109".tr,
                              size: Root.textsize,
                              textOverflow: TextOverflow.clip)))),
              GestureDetector(
                  onTap: () => Get.to(() => ContractPdf(title: "110".tr),
                      transition: Transition.fadeIn),
                  child: CustomCardLaw(
                      widget: Center(
                          child: CustomText(
                              color: Colors.white,
                              data: "110".tr,
                              size: Root.textsize,
                              textOverflow: TextOverflow.clip)))),
            ],
          ),
        ),
      ),
    );
  }
}

class ContractController extends GetxController {
  List<ContractData> filteredDetails = [];
  TextEditingController searchController = TextEditingController();

  void setData(Contract contract) {
    filteredDetails = contract.data;
    update();
  }

  void search(String text, Contract contract) {
    filteredDetails = contract.data
        .where((e) => e.dscrp!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    update();
  }
}

class Contract extends StatelessWidget {
  final List<ContractData> data;
  final String title;
  const Contract({
    required this.data,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ContractController controller = Get.put(ContractController());
    controller.setData(this);
    return GetBuilder<ContractController>(
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
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () => Data.getdoc(item.details!),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Theme.of(context).primaryColor),
                              child: Icon(
                                FontAwesomeIcons.download,
                                size: Root.iconsSize + 5,
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                          ),
                        ),
                        SelectableText.rich(
                          TextSpan(
                            children: Data.highlightOccurrences("${item.dscrp}",
                                controller.searchController.text),
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Root.textsize,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            
          );
        });
  }
}
