import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:law/class/datahelper.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customnonotes.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class CasesController extends GetxController {
  TextEditingController type = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController date = TextEditingController();
  List casesData = [];

  Future getcasec() async {
    casesData = await DBHelper().getCases();
    update();
  }
}

class Cases extends StatelessWidget {
  const Cases({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CasesController>(
        init: CasesController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: CustomText(
                  color: Theme.of(context).appBarTheme.foregroundColor!,
                  data: "74".tr,
                  size: Root.textsize,
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
                      color: Theme.of(context).indicatorColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: Root.iconsSize,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: controller.casesData.isEmpty
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
                                    return Theme.of(context).indicatorColor;
                                  },
                                ),
                                dataRowMaxHeight: 75,
                                columns: [
                                  DataColumn(
                                      label: CustomText(
                                          color: Theme.of(context).primaryColor,
                                          data: "78".tr,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip)),
                                  DataColumn(
                                      label: CustomText(
                                          color: Theme.of(context).primaryColor,
                                          data: "79".tr,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip)),
                                  DataColumn(
                                      label: CustomText(
                                          color: Theme.of(context).primaryColor,
                                          data: "80".tr,
                                          size: Root.textsize,
                                          textOverflow: TextOverflow.clip)),
                                  DataColumn(label: Container()),
                                  DataColumn(label: Container())
                                ],
                                rows: List.generate(
                                  controller.casesData.length,
                                  (rowIndex) => DataRow(
                                    cells: [
                                      DataCell(
                                        SizedBox(
                                          width: Get.width * .2,
                                          child: CustomText(
                                            color: Theme.of(context).focusColor,
                                            data:
                                                "${controller.casesData[rowIndex]["type"]}",
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(
                                          width: Get.width * .15,
                                          child: CustomText(
                                            color: Theme.of(context).focusColor,
                                            data: controller.casesData[rowIndex]
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
                                            color: Theme.of(context).focusColor,
                                            data: controller.casesData[rowIndex]
                                                ["date"]!,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        GestureDetector(
                                          onTap: () {
                                            controller.price.text = controller
                                                .casesData[rowIndex]["price"]!;
                                            controller.date.text = controller
                                                .casesData[rowIndex]["date"]!;
                                            controller.type.text = controller
                                                .casesData[rowIndex]["type"]!;
                                            Get.to(
                                                () => ADDCases(
                                                      edit: true,
                                                      id: controller
                                                          .casesData[rowIndex],
                                                    ),
                                                transition: Transition.fadeIn);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .indicatorColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                FontAwesomeIcons.penToSquare,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: Root.iconsSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        GestureDetector(
                                          onTap: () {
                                            DBHelper().deleteCases(controller
                                                .casesData[rowIndex]['id']);
                                            controller.getcasec();
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
          );
        });
  }
}

class ADDCases extends StatelessWidget {
  final bool edit;
  final Map id;
  const ADDCases({required this.edit, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    CasesController controller = Get.put(CasesController());
    controller.getcasec();
    return GetBuilder<CasesController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: CustomText(
                      color: Theme.of(context).appBarTheme.foregroundColor!,
                      data: "74".tr,
                      size: Root.textsize,
                      textOverflow: TextOverflow.ellipsis),
                  leading: const BackPageButton()),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .9,
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.type,
                            maxline: 1,
                            hints: "78".tr),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .9,
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.price,
                            maxline: 1,
                            hints: "79".tr),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .9,
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.date,
                            maxline: 1,
                            hints: "80".tr),
                      ),
                      SizedBox(
                        width: Get.width * .4,
                        child: CustomButton(
                            data: "82".tr,
                            ontap: () {
                              if (edit != true) {
                                DBHelper().insertcases(
                                  controller.type.text,
                                  controller.price.text,
                                  controller.date.text,
                                );
                                controller.getcasec();

                                AlertClass.success("48".tr);
                              } else {
                                DBHelper().updatecases(
                                  id['id'],
                                  controller.type.text,
                                  controller.price.text,
                                  controller.date.text,
                                );
                                controller.getcasec();

                                AlertClass.success("48".tr);
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ));
        });
  }
}
