import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/Data/services.dart';
import 'package:law/class/datahelper.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customnonotes.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class Cases extends StatelessWidget {
  const Cases({super.key});

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
                data: "74".tr,
                size: Root.headersize,
                textOverflow: TextOverflow.ellipsis),
            leading: const BackPageButton(),
            actions: [
              GestureDetector(
                onTap: () => Get.to(
                    () => const ADDCases(
                          edit: false,
                          id: {},
                        ),
                    transition: Transition.fadeIn),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Root.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: Root.headersize,
                      color: Root.secondry,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Directionality(
                textDirection: LanguageClass.lang.text == "English"
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: Center(
                  child: CasesClass.casesData.isEmpty
                      ? const Center(
                          child: CustomNoNotes(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                headingRowColor: MaterialStateColor.resolveWith(
                                  (states) {
                                    return Root.primary;
                                  },
                                ),
                                dataRowMaxHeight: 75,
                                columns: [
                                  DataColumn(
                                      label: CustomText(
                                          color: Root.secondry,
                                          data: "78".tr,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip)),
                                  DataColumn(
                                      label: CustomText(
                                          color: Root.secondry,
                                          data: "79".tr,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip)),
                                  DataColumn(
                                      label: CustomText(
                                          color: Root.secondry,
                                          data: "80".tr,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip)),
                                  DataColumn(label: Container()),
                                  DataColumn(label: Container())
                                ],
                                rows: List.generate(
                                  CasesClass.casesData.length,
                                  (rowIndex) => DataRow(
                                    cells: [
                                      DataCell(
                                        SizedBox(
                                          width: Get.width * .2,
                                          child: CustomText(
                                            color: Root.primary,
                                            data:
                                                "${CasesClass.casesData[rowIndex]["type"]}",
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: Get.width * .15,
                                          child: CustomText(
                                            color: Root.primary,
                                            data: CasesClass.casesData[rowIndex]
                                                ["price"]!,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: Get.width * .15,
                                          child: CustomText(
                                            color: Root.primary,
                                            data: CasesClass.casesData[rowIndex]
                                                ["date"]!,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        GestureDetector(
                                          onTap: () {
                                            CasesClass.price.text = CasesClass
                                                .casesData[rowIndex]["price"]!;
                                            CasesClass.date.text = CasesClass
                                                .casesData[rowIndex]["date"]!;
                                            CasesClass.type.text = CasesClass
                                                .casesData[rowIndex]["type"]!;
                                            Get.to(
                                                () => ADDCases(
                                                      edit: true,
                                                      id: CasesClass
                                                          .casesData[rowIndex],
                                                    ),
                                                transition: Transition.fadeIn);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: Root.primary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                FontAwesomeIcons.penToSquare,
                                                color: Colors.white,
                                                size: Root.iconsSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        GestureDetector(
                                          onTap: () {
                                            DBHelper().deleteCases(CasesClass
                                                .casesData[rowIndex]['id']);
                                            CasesClass.getcasec();
                                            AlertClass.success("48".tr);
                                            Get.forceAppUpdate();
                                            Get.appUpdate();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 8),
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                FontAwesomeIcons.x,
                                                color: Colors.white,
                                                size: Root.iconsSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                )),
          ),
        ));
  }
}

class ADDCases extends StatelessWidget {
  final bool edit;
  final Map id;
  const ADDCases({required this.edit, required this.id, super.key});

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
                  data: "74".tr,
                  size: Root.headersize,
                  textOverflow: TextOverflow.ellipsis),
              leading: const BackPageButton()),
          body: Directionality(
              textDirection: LanguageClass.lang.text == "English"
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                            onChanged: (s) {},
                            textInputType: TextInputType.name,
                            controller: CasesClass.type,
                            maxline: 1,
                            maxlength: 100,
                            hints: "78".tr),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                            onChanged: (s) {},
                            textInputType: TextInputType.name,
                            controller: CasesClass.price,
                            maxline: 1,
                            maxlength: 100,
                            hints: "79".tr),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                            onChanged: (s) {},
                            textInputType: TextInputType.name,
                            controller: CasesClass.date,
                            maxline: 1,
                            maxlength: 100,
                            hints: "80".tr),
                      ),
                      SizedBox(
                        width: Get.width * .8,
                        child: CustomButton(
                            data: "82".tr,
                            ontap: () {
                              if (edit != true) {
                                DBHelper().insertcases(
                                  CasesClass.type.text,
                                  CasesClass.price.text,
                                  CasesClass.date.text,
                                );
                                CasesClass.getcasec();

                                AlertClass.success("48".tr);
                              } else {
                                DBHelper().updatecases(id['id']);
                                CasesClass.getcasec();

                                AlertClass.success("48".tr);
                              }
                              CasesClass.clear();
                              Get.forceAppUpdate();
                              Get.appUpdate();
                            }),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
