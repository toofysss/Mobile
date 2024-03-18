import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class BicycleContractController extends GetxController {
  String gender = "213".tr;
  TextEditingController moredetails = TextEditingController();
  TextEditingController paynames = TextEditingController();
  TextEditingController payaddress = TextEditingController();
  TextEditingController paymahalas = TextEditingController();
  TextEditingController paynalley = TextEditingController();
  TextEditingController paynos = TextEditingController();
  TextEditingController paytypes = TextEditingController();
  TextEditingController payIDNo = TextEditingController();
  TextEditingController payPhone = TextEditingController();
  TextEditingController customernames = TextEditingController();
  TextEditingController customeraddress = TextEditingController();
  TextEditingController customermahalas = TextEditingController();
  TextEditingController customernalley = TextEditingController();
  TextEditingController customernos = TextEditingController();
  TextEditingController customertypes = TextEditingController();
  TextEditingController customerIDNo = TextEditingController();
  TextEditingController customerPhone = TextEditingController();
  TextEditingController carNo = TextEditingController();
  TextEditingController cartype = TextEditingController();
  TextEditingController carmodel = TextEditingController();
  TextEditingController carcolor = TextEditingController();
  TextEditingController carengineNo = TextEditingController();
  TextEditingController carChassis = TextEditingController();
  TextEditingController carprice = TextEditingController();
  TextEditingController carpayment = TextEditingController();
  TextEditingController carResidual = TextEditingController();
  TextEditingController carRestorePrice = TextEditingController();
}

class BicycleContract extends StatelessWidget {
  final String title;
  const BicycleContract({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BicycleContractController>(
        init: BicycleContractController(),
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
                            border:
                                Border.all(width: 1.5, color: Root.primary)),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                color: Root.primary,
                                data: "124".tr,
                                size: Root.headersize,
                                textOverflow: TextOverflow.clip),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.paynames,
                                  maxline: 1,
                                  hints: "117".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.payaddress,
                                  maxline: 1,
                                  hints: "199".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.paymahalas,
                                  maxline: 1,
                                  hints: "118".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.paynalley,
                                  maxline: 1,
                                  hints: "119".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.paynos,
                                  maxline: 1,
                                  hints: "120".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.paytypes,
                                  maxline: 1,
                                  hints: "186".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  controller: controller.payIDNo,
                                  maxline: 1,
                                  hints: "123".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  controller: controller.payPhone,
                                  maxline: 1,
                                  hints: "71".tr),
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
                                color: Root.primary,
                                data: "125".tr,
                                size: Root.headersize,
                                textOverflow: TextOverflow.clip),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.customernames,
                                  maxline: 1,
                                  hints: "121".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.customeraddress,
                                  maxline: 1,
                                  hints: "199".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.customermahalas,
                                  maxline: 1,
                                  hints: "118".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.customernalley,
                                  maxline: 1,
                                  hints: "119".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.customernos,
                                  maxline: 1,
                                  hints: "120".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.customertypes,
                                  maxline: 1,
                                  hints: "186".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  controller: controller.customerIDNo,
                                  maxline: 1,
                                  hints: "123".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  controller: controller.customerPhone,
                                  maxline: 1,
                                  hints: "71".tr),
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
                                color: Root.primary,
                                data: "202".tr,
                                size: Root.headersize,
                                textOverflow: TextOverflow.clip),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.moredetails,
                                  maxline: 1,
                                  hints: "201".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.carNo,
                                  maxline: 1,
                                  hints: "189".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.cartype,
                                  maxline: 1,
                                  hints: "190".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.carmodel,
                                  maxline: 1,
                                  hints: "191".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.carcolor,
                                  maxline: 1,
                                  hints: "192".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.name,
                                  controller: controller.carengineNo,
                                  maxline: 1,
                                  hints: "193".tr),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: CustomTextField(
                                  textInputType: TextInputType.number,
                                  controller: controller.carChassis,
                                  maxline: 1,
                                  hints: "194".tr),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.number,
                            controller: controller.carprice,
                            maxline: 1,
                            hints: "137".tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.number,
                            controller: controller.carpayment,
                            maxline: 1,
                            hints: "196".tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.number,
                            controller: controller.carRestorePrice,
                            maxline: 1,
                            hints: "197".tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CustomTextField(
                            textInputType: TextInputType.number,
                            controller: controller.carResidual,
                            maxline: 1,
                            hints: "198".tr),
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
                                    Tafqeet.convert(controller.carprice.text);
                                String pricepayment =
                                    Tafqeet.convert(controller.carpayment.text);
                                String pricRestorePrice = Tafqeet.convert(
                                    controller.carRestorePrice.text);
                                ContactClass.createPdf(
                                    'عقد بيع وشراء الدراجات والتكتك',
                                    '',
                                    "الـطــرف الأول :: البائع ${controller.paynames.text} \n الساكن ${controller.payaddress.text} محلة ${controller.paymahalas.text} زقاق ${controller.paynalley.text} دار ${controller.paynos.text} رقم الهوية ${controller.payIDNo.text} جهة الاصدار ${controller.paytypes.text}  رقم الهاتف ${controller.payPhone.text} \nالـطــرف الثاني :: المشتري ${controller.customernames.text} \n الساكن ${controller.customeraddress.text} محلة ${controller.customermahalas.text} زقاق ${controller.customernalley.text} دار ${controller.customernos.text} رقم الهوية ${controller.customerIDNo.text} جهة الاصدار ${controller.customertypes.text}  رقم الهاتف ${controller.customerPhone.text} ",
                                    '',
                                    '''
        اولاً :: باع الطرف الأول للطرف الثاني ${controller.moredetails.text} المرقمه ${controller.carNo.text} 
        من نوع ${controller.cartype.text}   موديل ${controller.carmodel.text}  اللون  ${controller.carcolor.text}                         
        رقم المحرك ${controller.carengineNo.text}  رقم الشاصي  ${controller.carChassis.text}
        ثانيا :: بدل البيع  قدره رقما ${controller.carprice.text}  كتابة   $price ${controller.gender}                                      
        وقد قبض البائع مبلغ قـــدره (${controller.carpayment.text}) كـتابة ($pricepayment) ${controller.gender}
        والباقي مــــــن المبلغ  قـدره (${controller.carRestorePrice.text}) كــتابة ($pricRestorePrice) ${controller.gender}
        ثالثا ً :: البائع الحائز (${controller.paynames.text})
        الساكن ${controller.payaddress.text} محله ${controller.paymahalas.text} زقاق ${controller.paynalley.text} دار ${controller.paynos.text}
        هاتف ${controller.payPhone.text} رقم الهوية ${controller.payIDNo.text} جهه الإصدار ${controller.paytypes.text}
        الملاحظات ::
        1.على البائع والمشتري الالتزام بتسجيل الدراجة او التكتك حسب قانون المرور والمعرض غير مسؤول خلاف ذلك .
        2.الطرف الأول وهو البائع مسؤول عن دفع كافة الغرامات المرورية والكمركية و الضرائب وجميع ما يترتب على الدراجة او التكتك من ديون او دعاوى في المحاكم لغاية يوم البيع .
        3.اذا نكل احد الطرفان  يدفع الناكل تضمينات قدرها (${controller.carResidual.text}) .
        4.تبلغ الطرفان بمعرفة دار وعنوان كل منهما  و الطرفان متعارفان خارج المكتب والمكتب غير مسؤول عن ذلك .
        حرر العقد بتاريخ $formattedDateTime 
        
        ''',
                                    'عن إقرار الطرف الأول \n البائع',
                                    'عن إقرار الطرف الثاني \n المشتري ',
                                    '',
                                    '',
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
