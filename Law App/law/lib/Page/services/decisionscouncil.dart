import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/decisionscouncilministers.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';

class DecisionsCouncilMinisters extends StatefulWidget {
  final List<DecisionsClass> data;
  final String title;
  const DecisionsCouncilMinisters(
      {required this.data, required this.title, Key? key})
      : super(key: key);

  @override
  State<DecisionsCouncilMinisters> createState() =>
      _DecisionsCouncilMinistersState();
}

class _DecisionsCouncilMinistersState extends State<DecisionsCouncilMinisters> {
  final scroll = ScrollController();
  @override
  void initState() {
    super.initState();
    ServicesSection.searchController.clear();
    ServicesSection.filteredDetails = widget.data;
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
          title: CustomTextSearch(
              controller: ServicesSection.searchController,
              hints: "44".tr,
              onChanged: (text) {
                setState(() {
                  ServicesSection.filteredDetails = widget.data
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
          textDirection:  TextDirection.rtl,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: ServicesSection.filteredDetails.length,
            itemBuilder: (context, index) {
              var item = ServicesSection.filteredDetails[index];
              return CustomCardLaw(
                widget: Center(
                  child: SelectableText.rich(
                    TextSpan(
                      children: Data.highlightOccurrences("${item.dscrp}",
                          ServicesSection.searchController.text),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Root.textsize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
