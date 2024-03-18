import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class MarriedContractController extends GetxController {
  TextEditingController laweyrsname = TextEditingController();
  String married = "184".tr;
  TextEditingController laweyrsaddress = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController useraddress = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController dscrp = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController payname = TextEditingController();
  TextEditingController payhome = TextEditingController();
  TextEditingController payahalla = TextEditingController();
  TextEditingController payalley = TextEditingController();
  TextEditingController userhome = TextEditingController();
  TextEditingController userahalla = TextEditingController();
  TextEditingController useralley = TextEditingController();
}

class MarriedContract extends StatelessWidget {
  final String title;
  const MarriedContract({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarriedContractController>(
        init: MarriedContractController(),
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
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1.5,
                                color: Theme.of(context).indicatorColor)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .foregroundColor!,
                                  data: "146".tr,
                                  size: Root.headersize,
                                  textOverflow: TextOverflow.clip),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payname,
                                  maxline: 1,
                                  hints: "139".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payahalla,
                                  maxline: 1,
                                  hints: "141".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payalley,
                                  maxline: 1,
                                  hints: "142".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payhome,
                                  maxline: 1,
                                  hints: "143".tr),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1.5,
                                color: Theme.of(context).indicatorColor)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                  color: Theme.of(context)
                                      .appBarTheme
                                      .foregroundColor!,
                                  data: "147".tr,
                                  size: Root.textsize,
                                  textOverflow: TextOverflow.clip),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.username,
                                  maxline: 1,
                                  hints: "140".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.userahalla,
                                  maxline: 1,
                                  hints: "141".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.useralley,
                                  maxline: 1,
                                  hints: "176".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.userhome,
                                  maxline: 1,
                                  hints: "143".tr),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 1.5,
                                color: Theme.of(context).indicatorColor)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                color: Theme.of(context)
                                    .appBarTheme
                                    .foregroundColor!,
                                data: "144".tr,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.laweyrsname,
                                  maxline: 1,
                                  hints: "148".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.laweyrsaddress,
                                  maxline: 1,
                                  hints: "143".tr),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(width: 1.5, color: Root.primary)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                color: Theme.of(context)
                                    .appBarTheme
                                    .foregroundColor!,
                                data: "145".tr,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.useraddress,
                                  maxline: 1,
                                  hints: "148".tr),
                            ),
                            Container(
                              width: Get.width * .9,
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.total,
                                  maxline: 1,
                                  hints: "143".tr),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.dscrp,
                            maxline: 1,
                            hints: "149".tr),
                      ),
                      Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.price,
                            maxline: 1,
                            hints: "150".tr),
                      ),
                      Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Material(
                          elevation: 6,
                          shadowColor: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(30),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              iconEnabledColor:
                                  Theme.of(context).indicatorColor,
                              iconDisabledColor:
                                  Theme.of(context).indicatorColor,
                              borderRadius: BorderRadius.circular(25),
                              hint: Center(
                                child: CustomText(
                                    color: Theme.of(context).indicatorColor,
                                    data: controller.married,
                                    textOverflow: TextOverflow.clip,
                                    size: Root.textsize),
                              ),
                              onChanged: (value) {
                                controller.married = "$value";
                                Get.appUpdate();
                                Get.forceAppUpdate();
                              },
                              items: [
                                "عند المطالبة والميسرة",
                                "عند اقرب الأجلين",
                              ]
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                              value: value,
                                              child: Center(
                                                child: CustomText(
                                                  color: Theme.of(context)
                                                      .indicatorColor,
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
                                String dscrp =
                                    Tafqeet.convert(controller.dscrp.text);
                                String price =
                                    Tafqeet.convert(controller.price.text);
                                ContactClass.createPdf(
                                    'بسم الله الرحمن الرحيم \n (( ورقة عقد الزواج )) ',
                                    'ومن اياته ان خلق لكم من أنفسكم ازاجا لتسكنوا اليها وجعل بينكم مودة ورحمة صدق الله العلي العظيم  .\nلقــــــد حضـــــر الزوج المســمى ( ${controller.payname.text}  ) وطلــــــــــب تنظيم مستند زواج  على زوجتـــــــــــــــه   (   ${controller.username.text}   ) \nوهما بكامل قواهما العقلية والنفسية وعلى الاتفاق الحاصل بينهما على تسمية المهرين المعجل المؤجل و كالاتي\nالمهر المعجل ( ${controller.dscrp.text} ) $dscrp المهر المؤجل (${controller.price.text}) $price  يستحق  ${controller.married} .\n تم العقد بتاريخ    $formattedDateTime',
                                    'إقرار الزوج \n الاسم : ${controller.username.text} \n الحالة الزوجية : ${controller.userahalla.text} \n المعرف : ${controller.useralley.text} \n العنوان : ${controller.userhome.text} \n \n \n ',
                                    'إقرار الزوجة \n الاسم : ${controller.payname.text} \n الحالة الزوجية : ${controller.payahalla.text} \n المعرفة : ${controller.payalley.text} \n العنوان : ${controller.payhome.text} ',
                                    '\n',
                                    'الشاهد الأول البالغ سن الرشد \n الاسم :${controller.useraddress.text} \n العنوان : ${controller.total.text} ',
                                    'الشاهد الثاني البالغ سن الرشد \n الاسم :${controller.laweyrsname.text} \n العنوان : ${controller.laweyrsaddress.text} ',
                                    '',
                                    '\n المستمع لصيغة الطلاق',
                                    '',
                                    '');
                              })),
                    ],
                  ),
                ),
              ));
        });
  }
}
