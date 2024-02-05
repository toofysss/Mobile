import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class BicycleContract extends StatefulWidget {
  final String title;
  const BicycleContract({required this.title, super.key});
  @override
  State<BicycleContract> createState() => _BicycleContractState();
}

class _BicycleContractState extends State<BicycleContract> {
  @override
  void initState() {
    ContactClass.gender = "213".tr;
    super.initState();
  }

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
              data: widget.title,
              size: Root.headersize,
              textOverflow: TextOverflow.clip),
          leading: const BackPageButton()    ),
        body: Directionality(
            textDirection: LanguageClass.lang.text == "English"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
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
                              data: "124".tr,
                              size: Root.headersize,
                              textOverflow: TextOverflow.clip),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.paynames,
                                maxline: 1,
                                maxlength: 1,
                                hints: "117".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.payaddress,
                                maxline: 1,
                                maxlength: 1,
                                hints: "199".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.paymahalas,
                                maxline: 1,
                                maxlength: 1,
                                hints: "118".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.paynalley,
                                maxline: 1,
                                maxlength: 1,
                                hints: "119".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.paynos,
                                maxline: 1,
                                maxlength: 1,
                                hints: "120".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.paytypes,
                                maxline: 1,
                                maxlength: 1,
                                hints: "186".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.number,
                                onChanged: (s) {},
                                controller: ContactClass.payIDNo,
                                maxline: 1,
                                maxlength: 1,
                                hints: "123".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.number,
                                onChanged: (s) {},
                                controller: ContactClass.payPhone,
                                maxline: 1,
                                maxlength: 1,
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
                          border: Border.all(width: 1.5, color: Root.primary)),
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
                                onChanged: (s) {},
                                controller: ContactClass.customernames,
                                maxline: 1,
                                maxlength: 1,
                                hints: "121".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.customeraddress,
                                maxline: 1,
                                maxlength: 1,
                                hints: "199".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.customermahalas,
                                maxline: 1,
                                maxlength: 1,
                                hints: "118".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.customernalley,
                                maxline: 1,
                                maxlength: 1,
                                hints: "119".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.customernos,
                                maxline: 1,
                                maxlength: 1,
                                hints: "120".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.customertypes,
                                maxline: 1,
                                maxlength: 1,
                                hints: "186".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.number,
                                onChanged: (s) {},
                                controller: ContactClass.customerIDNo,
                                maxline: 1,
                                maxlength: 1,
                                hints: "123".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.number,
                                onChanged: (s) {},
                                controller: ContactClass.customerPhone,
                                maxline: 1,
                                maxlength: 1,
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
                          border: Border.all(width: 1.5, color: Root.primary)),
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
                                onChanged: (s) {},
                                controller: ContactClass.moredetails,
                                maxline: 1,
                                maxlength: 1,
                                hints: "201".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.carNo,
                                maxline: 1,
                                maxlength: 1,
                                hints: "189".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.cartype,
                                maxline: 1,
                                maxlength: 1,
                                hints: "190".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.carmodel,
                                maxline: 1,
                                maxlength: 1,
                                hints: "191".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.carcolor,
                                maxline: 1,
                                maxlength: 1,
                                hints: "192".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.carengineNo,
                                maxline: 1,
                                maxlength: 1,
                                hints: "193".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.number,
                                onChanged: (s) {},
                                controller: ContactClass.carChassis,
                                maxline: 1,
                                maxlength: 1,
                                hints: "194".tr),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.carprice,
                          maxline: 1,
                          maxlength: 1,
                          hints: "137".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.carpayment,
                          maxline: 1,
                          maxlength: 1,
                          hints: "196".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.carRestorePrice,
                          maxline: 1,
                          maxlength: 1,
                          hints: "197".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.carResidual,
                          maxline: 1,
                          maxlength: 1,
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
                                  data: ContactClass.gender,
                                  textOverflow: TextOverflow.clip,
                                  size: Root.textsize),
                            ),
                            onChanged: (value) {
                              ContactClass.gender = "$value";
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
                                  Tafqeet.convert(ContactClass.carprice.text);
                              String pricepayment =
                                  Tafqeet.convert(ContactClass.carpayment.text);
                              String pricRestorePrice = Tafqeet.convert(
                                  ContactClass.carRestorePrice.text);
                              ContactClass.createPdf(
                                  'عقد بيع وشراء الدراجات والتكتك',
                                  '',
                                  "الـطــرف الأول :: البائع ${ContactClass.paynames.text} \n الساكن ${ContactClass.payaddress.text} محلة ${ContactClass.paymahalas.text} زقاق ${ContactClass.paynalley.text} دار ${ContactClass.paynos.text} رقم الهوية ${ContactClass.payIDNo.text} جهة الاصدار ${ContactClass.paytypes.text}  رقم الهاتف ${ContactClass.payPhone.text} \nالـطــرف الثاني :: المشتري ${ContactClass.customernames.text} \n الساكن ${ContactClass.customeraddress.text} محلة ${ContactClass.customermahalas.text} زقاق ${ContactClass.customernalley.text} دار ${ContactClass.customernos.text} رقم الهوية ${ContactClass.customerIDNo.text} جهة الاصدار ${ContactClass.customertypes.text}  رقم الهاتف ${ContactClass.customerPhone.text} ",
                                  '',
                                  '''
اولاً :: باع الطرف الأول للطرف الثاني ${ContactClass.moredetails.text} المرقمه ${ContactClass.carNo.text} 
من نوع ${ContactClass.cartype.text}   موديل ${ContactClass.carmodel.text}  اللون  ${ContactClass.carcolor.text}                         
رقم المحرك ${ContactClass.carengineNo.text}  رقم الشاصي  ${ContactClass.carChassis.text}
ثانيا :: بدل البيع  قدره رقما ${ContactClass.carprice.text}  كتابة   $price ${ContactClass.gender}                                      
وقد قبض البائع مبلغ قـــدره (${ContactClass.carpayment.text}) كـتابة ($pricepayment) ${ContactClass.gender}
والباقي مــــــن المبلغ  قـدره (${ContactClass.carRestorePrice.text}) كــتابة ($pricRestorePrice) ${ContactClass.gender}
ثالثا ً :: البائع الحائز (${ContactClass.paynames.text})
الساكن ${ContactClass.payaddress.text} محله ${ContactClass.paymahalas.text} زقاق ${ContactClass.paynalley.text} دار ${ContactClass.paynos.text}
هاتف ${ContactClass.payPhone.text} رقم الهوية ${ContactClass.payIDNo.text} جهه الإصدار ${ContactClass.paytypes.text}
الملاحظات ::
1.على البائع والمشتري الالتزام بتسجيل الدراجة او التكتك حسب قانون المرور والمعرض غير مسؤول خلاف ذلك .
2.الطرف الأول وهو البائع مسؤول عن دفع كافة الغرامات المرورية والكمركية و الضرائب وجميع ما يترتب على الدراجة او التكتك من ديون او دعاوى في المحاكم لغاية يوم البيع .
3.اذا نكل احد الطرفان  يدفع الناكل تضمينات قدرها (${ContactClass.carResidual.text}) .
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
            )),
      ),
    );
  }
}
