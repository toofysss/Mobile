import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class BillContractController extends GetxController {
  String gender = "213".tr;
  TextEditingController price = TextEditingController();
  TextEditingController useraddress = TextEditingController();
  TextEditingController laweyrsname = TextEditingController();
  TextEditingController customernames = TextEditingController();
  TextEditingController customerIDNo = TextEditingController();
}

class BillContract extends StatelessWidget {
  final String title;
  const BillContract({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillContractController>(
        init: BillContractController(),
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
                physics: const BouncingScrollPhysics(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.customernames,
                            maxline: 1,
                            hints: "148".tr),
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
                            hints: "210".tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.useraddress,
                            maxline: 1,
                            hints: "211".tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.laweyrsname,
                            maxline: 1,
                            hints: "212".tr),
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
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                              value: value,
                                              child: Center(
                                                child: CustomText(
                                                  color: Root.primary,
                                                  data: value,
                                                  size: Root.textsize,
                                                  textOverflow:
                                                      TextOverflow.clip,
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
                                    '( وصل قبض )',
                                    '''
        ${controller.gender} :: $price فقط  لا غيرها
        التاريخ $formattedDateTime   
        أستلمت من السيد : ${controller.customernames.text}
        مـــبــلغــا وقـــدرة : ${controller.price.text}
        وذلـك عـن قـيـمـة : ${controller.customerIDNo.text}
        \n
        \n
        ''',
                                    '',
                                    '\n'
                                        '',
                                    '',
                                    'أسم وتـوقـيع المسلم ${controller.useraddress.text}',
                                    '\nأسم وتوقيع المستلم ${controller.laweyrsname.text}',
                                    15);
                              })),
                    ],
                  ),
                ),
              ));
        });
  }
}
