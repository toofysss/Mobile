import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/class/yourright.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customsearchbutton.dart';
import 'package:law/widget/customsearchtext.dart';
import 'package:law/widget/customtext.dart';

// حقوقك
class YourRight extends StatelessWidget {
  final List<YourRightDataClass> yourRightInstance;
  const YourRight({required this.yourRightInstance, super.key});

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
                    data: "15".tr,
                    size: Root.headersize,
                    textOverflow: TextOverflow.clip),
                leading: const BackPageButton()),
            body: Padding(
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
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
                              color: Root.secondry,
                              data: "${item.title}",
                              size: Root.textsize,
                              textOverflow: TextOverflow.ellipsis),
                        )));
                  },
                ))));
  }
}

class YourRightDetails extends StatefulWidget {
  final String data;
  final List<Details> details;
  const YourRightDetails(
      {required this.data, required this.details, super.key});
  @override
  State<YourRightDetails> createState() => _YourRightDetailsState();
}

class _YourRightDetailsState extends State<YourRightDetails> {
  TextEditingController controller = TextEditingController();
  List<Details> filteredDetails = [];

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
                        .where((e) => e.question!
                            .toLowerCase()
                            .contains(text.toLowerCase()))
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
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: filteredDetails.length,
              itemBuilder: (context, outerIndex) {
                var item = filteredDetails[outerIndex];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ExpansionTile(
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    backgroundColor: Root.primary,
                    textColor: Colors.white,
                    collapsedTextColor: Colors.white,
                    collapsedBackgroundColor: Root.primary,
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title: CustomText(
                        color: Root.secondry,
                        data: item.question!,
                        size: Root.textsize,
                        textOverflow: TextOverflow.clip),
                    children: [
                      ListTile(
                          title: CustomText(
                            color: Root.secondry,
                            data: item.answer!,
                            size: Root.textsize,
                            textOverflow: TextOverflow.clip,
                          ),
                          trailing: Visibility(
                            visible: item.laws!.isNotEmpty,
                            child: GestureDetector(
                              onTap: () => showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel: "",
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        Container(),
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                                transitionBuilder: (context, a1, a2, child) {
                                  return ScaleTransition(
                                    scale: Tween<double>(begin: .5, end: 1)
                                        .animate(a1),
                                    child: FadeTransition(
                                      opacity: Tween<double>(begin: .5, end: 1)
                                          .animate(a1),
                                      child: AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        backgroundColor: Colors.white,
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomText(
                                              color: Root.primary,
                                              data: "${item.laws}",
                                              size: Root.textsize,
                                              textOverflow: TextOverflow.clip,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: CustomButton(
                                                data: "85".tr,
                                                ontap: () => Get.back(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
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
                                  color: Root.primary,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
          )),
    );
  }
}
