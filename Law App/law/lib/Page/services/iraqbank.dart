import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/iraqbank.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customloading.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IraqBankDetailsController extends GetxController {
  List<IraqBankDataClass> filteredDetails = [];
  TextEditingController searchController = TextEditingController();
  void setData(IraqBankDetails contract) {
    filteredDetails = contract.details;
    update();
  }

  void search(String text, IraqBankDetails contract) {
    filteredDetails = contract.details
        .where((e) => e.title!.toLowerCase().contains(text.toLowerCase()))
        .toList();
    update();
  }
}

class IraqBank extends StatelessWidget {
  final List<IraqBankData> data;
  final String title;
  const IraqBank({required this.title, required this.data, super.key});

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
                data: title,
                size: Root.textsize,
                textOverflow: TextOverflow.clip),
            leading: const BackPageButton()),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                  return CustomCardLaw(
                    widget: GestureDetector(
                        child: Center(
                          child: CustomText(
                              color: Theme.of(context).primaryColor,
                              data: "${item.title}",
                              size: Root.textsize,
                              textOverflow: TextOverflow.clip),
                        ),
                        onTap: () => Get.to(
                              () => IraqBankDetails(
                                details: item.details!,
                                data: "${item.title}",
                              ),
                              transition: Transition.fadeIn,
                            )),
                  );
                })));
  }
}

class IraqBankDetails extends StatelessWidget {
  final List<IraqBankDataClass> details;
  final String data;
  const IraqBankDetails({required this.details, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    IraqBankDetailsController controller = Get.put(IraqBankDetailsController());
    controller.setData(this);
    return GetBuilder<IraqBankDetailsController>(
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
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.filteredDetails.length,
                    itemBuilder: (context, index) {
                      var item = controller.filteredDetails[index];
                      return GestureDetector(
                        onTap: () {
                          if ("${item.files}".isNotEmpty) {
                            Data.urllauncher("${item.files}");
                          } else {
                            Get.to(
                                () => IraqBankView(
                                      data: "${item.title}",
                                      dscrp: "${item.dscrp}",
                                      img: "${item.img}",
                                    ),
                                transition: Transition.fadeIn);
                          }
                        },
                        child: CustomCardLaw(
                          widget: Center(
                            child: RichText(
                              text: TextSpan(
                                children: Data.highlightOccurrences(
                                    "${item.title}",
                                    controller.searchController.text),
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: Root.textsize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          );
        });
  }
}

class IraqBankView extends StatelessWidget {
  final String img;
  final String dscrp;
  final String data;
  const IraqBankView(
      {required this.dscrp, required this.data, required this.img, super.key});

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
                data: data,
                size: Root.textsize,
                textOverflow: TextOverflow.ellipsis),
            leading: const BackPageButton()),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(
                  visible: img.isNotEmpty,
                  child: CustomCardLaw(
                      widget: CachedNetworkImage(
                    imageUrl: img,
                    fit: BoxFit.contain,
                    httpHeaders: const {"accept": "*/*"},
                    height: Get.height,
                    width: Get.width,
                    placeholder: (context, url) => SizedBox(
                        height: Get.height,
                        width: Get.width,
                        child: const Customloading()),
                  )),
                ),
                Visibility(
                  visible: img.isEmpty,
                  child: CustomCardLaw(
                    widget: Center(
                      child: CustomText(
                          color: Theme.of(context).primaryColor,
                          data: dscrp,
                          size: Root.textsize,
                          textOverflow: TextOverflow.clip),
                    ),
                  ),
                )
              ],
            )));
  }
}
