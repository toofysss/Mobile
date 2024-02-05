import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/law.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/Page/law/lawsearch.dart';
import 'package:law/Page/law/searchlaw.dart';
import 'package:law/class/law.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customflloatingsearch.dart';
import 'package:law/widget/customtext.dart';

class Law extends StatefulWidget {
  const Law({super.key});

  @override
  State<Law> createState() => _LawState();
}

class _LawState extends State<Law> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: CustomFloatingSearch(
          controller: LawClass.controllerlaw,
          hint: "6".tr,
          onchnage: (value) {
            setState(() {
              LawClass.filteredlaw = LawClass.data
                  .where((e) => e.dscrp!
                      .toLowerCase()
                      .contains(LawClass.controllerlaw.text.toLowerCase()))
                  .toList();
            });
          }),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomCardLaw(
              widget: GestureDetector(
                  child: Center(
                    child: CustomText(
                        color: Root.secondry,
                        data: "95".tr,
                        size: Root.textsize - 2,
                        textOverflow: TextOverflow.clip),
                  ),
                  onTap: () {
                    List<LawsData> data = [];
                    for (int i = 0; i < LawClass.data.length; i++) {
                      data.add(LawClass.data[i]);
                    }
                    Get.to(() => Search(item: data),
                        transition: Transition.fadeIn);
                    FocusScope.of(context).unfocus();
                  }),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                  height: Get.height,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: LawClass.filteredlaw.length,
                      itemBuilder: (context, index) {
                        var item = LawClass.filteredlaw[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                                () => LawSearch(
                                      item: item.details!,
                                      header: "${item.dscrp}",
                                    ),
                                transition: Transition.fadeIn);
                            FocusScope.of(context).unfocus();
                          },
                          child: CustomCardLaw(
                            widget: Center(
                                child: CustomText(
                                    color: Root.secondry,
                                    data: '${item.dscrp}',
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip)),
                          ),
                        );
                      })),
            ),
          ],
        ),
      )),
    );
  }
}
