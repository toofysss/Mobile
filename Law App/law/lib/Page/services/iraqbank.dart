import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/iraqbank.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customloading.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IraqBank extends StatelessWidget {
  final List<IraqBankData> data;
  final String title;
  const IraqBank({required this.title, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Root.backgroundApp,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: CustomText(
                  color: Root.primary,
                  data: title,
                  size: Root.headersize,
                  textOverflow: TextOverflow.clip),
              leading: const BackPageButton()),
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var item = data[index];
                        return GestureDetector(
                            onTap: () => Get.to(
                                  () => IraqBankDetails(
                                    details: item.details!,
                                    data: "${item.title}",
                                  ),
                                  transition: Transition.fadeIn,
                                ),
                            child: CustomCardLaw(
                              widget: Center(
                                child: CustomText(
                                    color: Root.secondry,
                                    data: "${item.title}",
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip),
                              ),
                            ));
                      }))),
        ));
  }
}

class IraqBankDetails extends StatefulWidget {
  final List<IraqBankDataClass> details;
  final String data;
  const IraqBankDetails({required this.details, required this.data, super.key});
  @override
  State<IraqBankDetails> createState() => _IraqBankDetailsState();
}

class _IraqBankDetailsState extends State<IraqBankDetails> {
  TextEditingController controller = TextEditingController();
  List<IraqBankDataClass> filteredDetails = [];

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
                controller: ServicesSection.searchController,
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
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filteredDetails.length,
                      itemBuilder: (context, index) {
                        var item = filteredDetails[index];
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
                                      "${item.title}", controller.text),
                                  style: TextStyle(
                                      color: Root.secondry,
                                      fontSize: Root.textsize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        );
                      }))),
        ));
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
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            backgroundColor: Root.backgroundApp,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: CustomText(
                    color: Root.primary,
                    data: data,
                    size: Root.headersize,
                    textOverflow: TextOverflow.ellipsis),
                leading: const BackPageButton()),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
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
                                color: Root.secondry,
                                data: dscrp,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip),
                          ),
                        ),
                      )
                    ],
                  )),
            )));
  }
}
