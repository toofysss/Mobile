import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/discriminatoryregulations.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';

class Discriminatoryregulations extends StatelessWidget {
  final List<DiscriminatoryregulationsData> data;
  final String title;
  const Discriminatoryregulations(
      {required this.data, required this.title, Key? key})
      : super(key: key);
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
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: List.generate(
                    data.length,
                    (index) => GestureDetector(
                          onTap: () => Get.to(
                              () => _DiscriminatoryregulationsDetailsState(
                                    details: data[index].details!,
                                    data: "${data[index].dscrp}",
                                  ),
                              transition: Transition.fadeIn),
                          child: CustomCardLaw(
                              widget: Center(
                                  child: CustomText(
                                      color: Root.secondry,
                                      data: "${data[index].dscrp}",
                                      size: Root.textsize,
                                      textOverflow: TextOverflow.clip))),
                        )),
              ),
            ),
          ),
        ));
  }
}

class _DiscriminatoryregulationsDetailsState extends StatefulWidget {
  final String data;
  final List<DiscriminatoryregulationsDetails> details;
  const _DiscriminatoryregulationsDetailsState(
      {required this.data, required this.details});
  @override
  State<_DiscriminatoryregulationsDetailsState> createState() =>
      __DiscriminatoryregulationsDetailsStateState();
}

class __DiscriminatoryregulationsDetailsStateState
    extends State<_DiscriminatoryregulationsDetailsState> {
  TextEditingController controller = TextEditingController();
  List<DiscriminatoryregulationsDetails> filteredDetails = [];

  @override
  void initState() {
    super.initState();
    controller.clear();
    filteredDetails = widget.details;
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
              controller: controller,
              hints: "44".tr,
              onChanged: (text) {
                setState(() {
                  filteredDetails = widget.details
                      .where((e) =>
                          e.title!.toLowerCase().contains(text.toLowerCase()))
                      .toList();
                });
              },
              showsearch: Data.isSearching,
              title: widget.data),
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
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: filteredDetails.length,
            itemBuilder: (context, index) {
              var item = filteredDetails[index];
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
                        children: Data.highlightOccurrences(
                            "${item.title}", controller.text),
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
