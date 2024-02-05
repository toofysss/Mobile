import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            leading: const BackPageButton(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: CustomText(
                color: Root.primary,
                data: title,
                size: Root.headersize,
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
                                color: Root.secondry,
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
      ),
    );
  }
}

class Contract extends StatefulWidget {
  final List<ContractData> data;
  final String title;
  const Contract({required this.data, required this.title, Key? key})
      : super(key: key);

  @override
  State<Contract> createState() => _ContractState();
}

class _ContractState extends State<Contract> {
  @override
  void initState() {
    super.initState();
    ServicesSection.searchController.clear();
    ContractClass.filteredDetails = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.backgroundApp,
        appBar: AppBar(
          leading: const BackPageButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: CustomTextSearch(
              controller: ServicesSection.searchController,
              hints: "44".tr,
              onChanged: (text) {
                setState(() {
                  ContractClass.filteredDetails = widget.data
                      .where((item) => item.dscrp!.contains(text))
                      .toList();
                });
              },
              showsearch: Data.isSearching,
              title: widget.title),
          actions: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    Data.isSearching = !Data.isSearching;
                  });
                },
                child: const CustomSearchButton()),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ContractClass.filteredDetails.length,
            itemBuilder: (context, index) {
              var item = ContractClass.filteredDetails[index];
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
                              color: Colors.white),
                          child: Icon(
                            FontAwesomeIcons.download,
                            size: Root.iconsSize + 5,
                            color: Root.primary,
                          ),
                        ),
                      ),
                    ),
                    SelectableText.rich(
                      TextSpan(
                        children: Data.highlightOccurrences("${item.dscrp}",
                            ServicesSection.searchController.text),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Root.textsize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
