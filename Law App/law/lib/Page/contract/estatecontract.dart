import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class EstateContractController extends GetxController {
  String gender = "213".tr;
  TextEditingController laweyrsname = TextEditingController();
  TextEditingController laweyrsaddress = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController useraddress = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController dscrp = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController lawname = TextEditingController();
  TextEditingController paymentway = TextEditingController();
  TextEditingController payname = TextEditingController();
  TextEditingController payhome = TextEditingController();
  TextEditingController payahalla = TextEditingController();
  TextEditingController payalley = TextEditingController();
  TextEditingController paytype = TextEditingController();
  TextEditingController payno = TextEditingController();
  TextEditingController userhome = TextEditingController();
  TextEditingController userahalla = TextEditingController();
  TextEditingController useralley = TextEditingController();
  TextEditingController usertype = TextEditingController();
  TextEditingController userno = TextEditingController();
  TextEditingController moredetails = TextEditingController();
  TextEditingController auctioneername = TextEditingController();
  TextEditingController cartype = TextEditingController();
  TextEditingController carResidual = TextEditingController();
}

class EstateContract extends StatelessWidget {
  final String title;
  const EstateContract({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstateContractController>(
        init: EstateContractController(),
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
                                  data: "124".tr,
                                  size: Root.textsize,
                                  textOverflow: TextOverflow.clip),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payname,
                                  maxline: 1,
                                  hints: "117".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payahalla,
                                  maxline: 1,
                                  hints: "118".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payalley,
                                  maxline: 1,
                                  hints: "119".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payhome,
                                  maxline: 1,
                                  hints: "120".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.paytype,
                                  maxline: 1,
                                  hints: "122".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payno,
                                  maxline: 1,
                                  hints: "123".tr),
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
                                data: "125".tr,
                                size: Root.headersize,
                                textOverflow: TextOverflow.clip),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.username,
                                  maxline: 1,
                                  hints: "121".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.userahalla,
                                  maxline: 1,
                                  hints: "118".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.useralley,
                                  maxline: 1,
                                  hints: "119".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.userhome,
                                  maxline: 1,
                                  hints: "120".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.usertype,
                                  maxline: 1,
                                  hints: "122".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.userno,
                                  maxline: 1,
                                  hints: "123".tr),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.laweyrsname,
                            maxline: 1,
                            hints: "126".tr),
                      ),
                       Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.laweyrsaddress,
                            maxline: 1,
                            hints: "127".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.useraddress,
                            maxline: 1,
                            hints: "128".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.total,
                            maxline: 2,
                            hints: "129".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.dscrp,
                            maxline: 1,
                            hints: "130".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.carResidual,
                            maxline: 1,
                            hints: "216".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.cartype,
                            maxline: 1,
                            hints: "217".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.number,
                            controller: controller.price,
                            maxline: 1,
                            hints: "137".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.number,
                            controller: controller.lawname,
                            maxline: 1,
                            hints: "131".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.number,
                            controller: controller.paymentway,
                            maxline: 1,
                            hints: "134".tr),
                      ),
                      Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.auctioneername,
                            maxline: 1,
                            hints: "135".tr),
                      ),
                        Container(
                        width: Get.width * .9,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomTextField(
                            textInputType: TextInputType.name,
                            controller: controller.moredetails,
                            maxline: 1,
                            hints: "136".tr),
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
                                String price =
                                    Tafqeet.convert(controller.price.text);
                                String price2 =
                                    Tafqeet.convert(controller.lawname.text);
                                ContactClass.createEstatePdf(
                                    'عقد بيع العقار',
                                    '',
                                    "الطرف الأول ( البــائـــع ) ${controller.payname.text} \n العنوان م ${controller.payahalla.text} ز ${controller.payalley.text} د ${controller.payhome.text} \nالمعرف بالهوية نوع ${controller.paytype.text} المرقمة ${controller.payno.text}"
                                        "\n"
                                        "الطرف الثاني ( المشتري ) ${controller.username.text}\n العنوان م ${controller.userahalla.text}ز ${controller.useralley.text}  د ${controller.userhome.text} \nالمعرف بالهوية نوع ${controller.usertype.text} المرقمة ${controller.userno.text}",
                                    "",
                                    ""
                                        '''
        أولا::  يعترف الطرف الأول بأنه قد باع الى الطرف الثاني الملك المفصل فيما يلي:-
        نوع الملك ${controller.laweyrsname.text}
        الرقم والتسلسل ${controller.laweyrsaddress.text}
        عنوان الملك المحلة ${controller.useraddress.text} زقاق ${controller.total.text} دار ${controller.dscrp.text}
        ثانيا :: أن بدل البيع المتفق عليه هو ( ${controller.price.text} )  ( $price )  ${controller.gender}.
        ثالثا :: يعترف الطرف الأول بأنه قد قبض من الطرف الثاني عربونا وقدره ( ${controller.lawname.text} )  ( $price2 ) ${controller.gender} واما باقي المبلغ فيدفع عند اكمال المعاملة و التقرير في دائرة التسجيل العقاري .
        رابعا::  اذا امتنع أي من الطرفين عن تنفيذ شروط هذا العقد ( النكول) يكون ملزما بدفع ضعف مبلغ العربون الى الطرف الآخر دون الحاجه الى انذار رسمي .
        خامسا :: ان  المقتضية للبيع ${controller.carResidual.text} هي على عاتق الطرف الاول البائع  ${controller.cartype.text} على عاتق الطرف الثاني المشتري
        ٦. يتعهد الطرفان بأن يدفع كل واحد منهما دلالية قدرها ( ${controller.paymentway.text} ) بالمائة الى الدلال ${controller.auctioneername.text} الذي توسط بعقد البيع بمجرد التوقيع على هذا العقد ولا تعاد في حالة اختلاف الطرفين .
        بناء على حصول التراضي والقبول حرر هذا العقد بتاريخ  $formattedDateTime
        فقرات إضافية : ${controller.moredetails.text}
        ''',
                                    'الطرف الاول ( البائع ) :${controller.payname.text} \n ',
                                    'الطرف الثاني ( المشتري ) :${controller.username.text} \n ',
                                    '',
                                    '',
                                    'الشاهد الأول',
                                    'الشاهد الثاني');
                              })),
                    ],
                  ),
                ),
              ));
        });
  }
}
