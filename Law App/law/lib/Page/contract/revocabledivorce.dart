import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class RevocableDivorceController extends GetxController {
  TextEditingController laweyrsname = TextEditingController();
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

class RevocableDivorce extends StatelessWidget {
  final String title;
  const RevocableDivorce({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RevocableDivorceController>(
        init: RevocableDivorceController(),
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
                          border: Border.all(width: 1.5, color: Root.primary)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                              color: Root.primary,
                              data: "146".tr,
                              size: Root.headersize,
                              textOverflow: TextOverflow.clip),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.payname,
                                maxline: 1,
                                hints: "139".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.payahalla,
                                maxline: 1,
                                hints: "141".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.payalley,
                                maxline: 1,
                                hints: "142".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
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
                          border: Border.all(width: 1.5, color: Root.primary)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                              color: Root.primary,
                              data: "147".tr,
                              size: Root.headersize,
                              textOverflow: TextOverflow.clip),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.username,
                                maxline: 1,
                                hints: "140".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.userahalla,
                                maxline: 1,
                                hints: "141".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.useralley,
                                maxline: 1,
                                hints: "176".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
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
                          border: Border.all(width: 1.5, color: Root.primary)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                              color: Root.primary,
                              data: "144".tr,
                              size: Root.headersize,
                              textOverflow: TextOverflow.clip),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.laweyrsname,
                                maxline: 1,
                                hints: "148".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
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
                          border: Border.all(width: 1.5, color: Root.primary)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                              color: Root.primary,
                              data: "145".tr,
                              size: Root.headersize,
                              textOverflow: TextOverflow.clip),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.useraddress,
                                maxline: 1,
                                hints: "148".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                controller: controller.total,
                                maxline: 1,
                                hints: "143".tr),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.dscrp,
                          maxline: 1,
                          hints: "152".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.price,
                          maxline: 1,
                          hints: "153".tr),
                    ),
                    Container(
                        width: Get.width * .8,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomButton(
                            data: "107".tr,
                            ontap: () {
                              ContactClass.createPdf(
                                  'بسم الله الرحمن الرحيم\n(( ورقة الطلاق الرجعي))',
                                  "الحمد لله الذي شرع واحل الطلاق لحسم النزاع وجعله نوعاً من أنواع المصالحة للعباد حيث قال الرسول الأمين (ص) ( الطلاق بين من اخذ بالساق ) وصل الله على محمد وعلى اله وصحبه إلى يـــــــــــــــوم الديـــــــن . وبعــــــــــــــد لقــــــــــد حضـــــــــــــــــر الرجـــــــــــــــــل المســـــــــــــــــــــــمى (${controller.payname.text}) وطلــــــــــب طـــــلاق زوجتـــــــــــــــه      (${controller.username.text}) وهو بكامل قواه العقلية وبعد الإرشاد والنصيحة فأصر على الطـــــــــلاق الرجعي وذلك لعــــــدم انسجام الحياة الزوجية بينهم وأجاب الزوج قائلاً زوجتي (${controller.price.text}) طالق طلقة رجعية واحدة بشهادة الله والحاضرين والله على كل شيء شهيد ... علماً إن الزوجة غائبة من محضر الطلاق .",
                                  'إقرار الزوج \n الاسم : ${controller.username.text} \n الحالة الزوجية : ${controller.userahalla.text} \n المعرف : ${controller.useralley.text} \n العنوان : ${controller.userhome.text} \n \n \n ',
                                  'إقرار الزوجة \n الاسم : ${controller.payname.text} \n الحالة الزوجية : ${controller.payahalla.text} \n المعرفة : ${controller.payalley.text} \n العنوان : ${controller.payhome.text} ',
                                  '\n',
                                  'الشاهد الأول البالغ سن الرشد \n الاسم :${controller.useraddress.text} \n العنوان : ${controller.total.text} ',
                                  'الشاهد الثاني البالغ سن الرشد \n الاسم :${controller.laweyrsname.text} \n العنوان : ${controller.laweyrsaddress.text} ',
                                  'ملاحظة : إفادة الزوج إن زوجته في حالة طهر يصح الطـلاق  وان الطلاق للمرة (${controller.dscrp.text}) \nكما تعهد الزوج بدفع كافة حقوق زوجته الشرعية والله خير الشاهدين \nوله حق الرجـوع إلى زوجته إثناء فترة العدة الشرعية البالغة ثلاثة أشهـر مـن تاريخ الطلاق وإنها متروكة الفراش ',
                                  '\n المستمع لصيغة الطلاق',
                                  '',
                                  '');
                            })),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
