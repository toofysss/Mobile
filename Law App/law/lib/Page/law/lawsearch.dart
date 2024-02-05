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
class LawSearch extends StatefulWidget {
  final List<LawDetails> item;
  final String header;
  const LawSearch({required this.header, required this.item, super.key});
  @override
  State<LawSearch> createState() => _LawSearchState();
}

class _LawSearchState extends State<LawSearch> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    super.initState();
    search.clear();
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
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // App Img Logo
                  Container(
                    height: 200,
                    width: 200,
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
                          color: Root.primary,
                          data: widget.header,
                          size: Root.headersize,
                          textOverflow: TextOverflow.clip),
                    ),
                  ),
                  // Search For Law
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                        textInputType: TextInputType.number,
                        onChanged: (text) {},
                        controller: search,
                        maxline: 1,
                        maxlength: 5,
                        hints: "88".tr),
                  ),
                  // View Law By Count
                  Container(
                    width: Get.width * .8,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomButton(
                        data: "89".tr,
                        ontap: () async {
                          if (search.text.isEmpty) {
                            return AlertClass.error("88".tr);
                          }
                          FocusScope.of(context).unfocus();

                          if (int.parse(search.text) > widget.item.length) {
                            return AlertClass.error(
                                "${'177'.tr} ${widget.item.length} ${'178'.tr}");
                          }
                          Get.to(
                              () => LawsDetails(
                                    item: widget.item,
                                    count: search.text,
                                    title: widget.header,
                                  ),
                              transition: Transition.fadeIn);
                          Future.delayed(const Duration(milliseconds: 800),
                              () => search.clear());
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
                                  item: widget.item,
                                  title: widget.header,
                                ),
                            transition: Transition.fadeIn)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// View Law By Count
class LawsDetails extends StatefulWidget {
  final List<LawDetails> item;
  final String count;
  final String title;
  const LawsDetails(
      {required this.title,
      required this.count,
      required this.item,
      super.key});

  @override
  State<LawsDetails> createState() => _LawsDetailsState();
}

class _LawsDetailsState extends State<LawsDetails> {
  List<LawDetails> filteredDetails = [];
  String data = "";
  getdata(String data) {
    filteredDetails = widget.item
        .where((e) =>
            e.dscrp!.toLowerCase().contains("المادة ${data.toLowerCase()}"))
        .toList();
    if (filteredDetails.isEmpty) {
      int data2 = int.parse(data) - 1;
      data = "$data2";
      getdata(data);
    }
  }

  @override
  void initState() {
    data = widget.count;
    getdata(data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.backgroundApp,
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
              color: Root.primary,
              data: widget.title,
              size: Root.headersize,
              textOverflow: TextOverflow.ellipsis),
          leading: const BackPageButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filteredDetails.length,
                          itemBuilder: (context, index) {
                            var item = filteredDetails[index];
                            return CustomCardLaw(
                                widget: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                  color: Colors.white,
                                  data: "${item.dscrp}",
                                  size: Root.textsize,
                                  textOverflow: TextOverflow.clip),
                            ));
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                                data: "179".tr,
                                ontap: () {
                                  if (data == "1") return;
                                  int data2 = int.parse(data) - 1;
                                  data = "$data2";
                                  getdata(data);
                                  Get.appUpdate();
                                  Get.forceAppUpdate();
                                }),
                            CustomButton(
                                data: "180".tr,
                                ontap: () {
                                  if (int.parse(data) == widget.item.length) {
                                    return;
                                  }
                                  int data2 = int.parse(data) + 1;
                                  data = "$data2";
                                  getdata(data);
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
                                      item: widget.item,
                                      title: widget.title,
                                    ),
                                transition: Transition.fadeIn)),
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}

// View Full Law
class FullLawDetails extends StatefulWidget {
  final List<LawDetails> item;
  final String title;
  const FullLawDetails({required this.title, required this.item, super.key});

  @override
  State<FullLawDetails> createState() => _FullLawDetailsState();
}

class _FullLawDetailsState extends State<FullLawDetails> {
  TextEditingController search = TextEditingController();
  List<LawDetails> filterdata = [];
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
        backgroundColor: Root.backgroundApp,
        appBar: AppBar(
          leading: const BackPageButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          actions: [
            Flexible(
              child: CustomFloatingSearch(
                controller: search,
                hint: "44".tr,
                onchnage: (text) {
                  setState(() {
                    filterdata = widget.item
                        .where((e) =>
                            e.dscrp!.toLowerCase().contains(text.toLowerCase()))
                        .toList();
                  });
                },
              ),
            ),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filterdata.length,
                          itemBuilder: (context, index) {
                            var item = filterdata[index];
                            return CustomCardLaw(
                              widget: RichText(
                                text: TextSpan(
                                  children: Data.highlightOccurrences(
                                      item.dscrp!, search.text),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Root.textsize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          })
                    ],
                  ))),
        ),
      ),
    );
  }
}
