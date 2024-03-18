import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class InsuranceController extends GetxController {
  String gender = "213".tr;

  TextEditingController laweyrsname = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController paynames = TextEditingController();
  TextEditingController customernames = TextEditingController();
  TextEditingController useraddress = TextEditingController();
  TextEditingController customerIDNo = TextEditingController();
  TextEditingController customernos = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController customeraddress = TextEditingController();
}

class Insurance extends StatelessWidget {
  final String title;
  const Insurance({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InsuranceController>(
        init: InsuranceController(),
        builder: (controller) {
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.paynames,
                          maxline: 1,
                          hints: "215".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.customernames,
                          maxline: 1,
                          hints: "214".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.price,
                          maxline: 1,
                          hints: "204".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.customerIDNo,
                          maxline: 1,
                          hints: "123".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.customernos,
                          maxline: 1,
                          hints: "206".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.department,
                          maxline: 1,
                          hints: "205".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.customeraddress,
                          maxline: 1,
                          hints: "39".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.useraddress,
                          maxline: 1,
                          hints: "207".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.laweyrsname,
                          maxline: 1,
                          hints: "208".tr),
                    ),
                    Container(
                      width: Get.width * 0.8,
                      margin: const EdgeInsets.only(top: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Root.primary,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Material(
                        elevation: 6,
                        shadowColor: Root.primary,
                        borderRadius: BorderRadius.circular(30),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            iconEnabledColor: Root.primary,
                            iconDisabledColor: Root.primary,
                            borderRadius: BorderRadius.circular(25),
                            hint: Center(
                              child: CustomText(
                                  color: Root.primary,
                                  data: controller.gender,
                                  textOverflow: TextOverflow.clip,
                                  size: Root.textsize),
                            ),
                            onChanged: (value) {
                              controller.gender = "$value";
                              Get.appUpdate();
                              Get.forceAppUpdate();
                            },
                            items: [
                              "دينار",
                              "دولار",
                            ]
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                          child: CustomText(
                                            color: Root.primary,
                                            data: value,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        )))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: Get.width * .8,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomButton(
                            data: "107".tr,
                            ontap: () {
                              DateTime now = DateTime.now();
                              String formattedDateTime =
                                  "${now.year}/${now.month}/${now.day}";
                              String price =
                                  Tafqeet.convert(controller.price.text);
                              ContactClass.insuancePdf(
                                  '( وصل أمانة )',
                                  '''
        ${controller.gender} ::  (${controller.price.text}) $price فقط لا غيرها
        اني الموقع ادناه استلمت المبلغ من السيد ${controller.paynames.text} امانة عندي اعيده له متى طلب مني ذلك واعترافا باستلامي الأمانة المذكورة وقعت هذا الوصل بتاريخ $formattedDateTime .
        
        ''',
                                  'الشاهد  \n الاسم \n${controller.useraddress.text}',
                                  'الشاهد  \n الاسم \n${controller.laweyrsname.text}',
                                  'الاســـــــــم : ${controller.customernames.text} \nرقم الهوية : ${controller.customerIDNo.text} \nتاريـخـهـــا : ${controller.customernos.text} \nعن إقــرار : ${controller.department.text} \nالــعــنـوان : ${controller.customeraddress.text}',
                                  '',
                                  '',
                                  15);
                            })),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
