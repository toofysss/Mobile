import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class Insurance extends StatefulWidget {
  final String title;
  const Insurance({required this.title, super.key});
  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
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
            leading: const BackPageButton()),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.paynames,
                          maxline: 1,
                          maxlength: 1,
                          hints: "215".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.customernames,
                          maxline: 1,
                          maxlength: 1,
                          hints: "214".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.price,
                          maxline: 1,
                          maxlength: 1,
                          hints: "204".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.customerIDNo,
                          maxline: 1,
                          maxlength: 1,
                          hints: "123".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.customernos,
                          maxline: 1,
                          maxlength: 1,
                          hints: "206".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.department,
                          maxline: 1,
                          maxlength: 1,
                          hints: "205".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.customeraddress,
                          maxline: 1,
                          maxlength: 1,
                          hints: "39".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.useraddress,
                          maxline: 1,
                          maxlength: 1,
                          hints: "207".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.laweyrsname,
                          maxline: 1,
                          maxlength: 1,
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
                                  Tafqeet.convert(ContactClass.price.text);
                              ContactClass.insuancePdf(
                                  '( وصل أمانة )',
                                  '''
${ContactClass.gender} ::  (${ContactClass.price.text}) $price فقط لا غيرها
اني الموقع ادناه استلمت المبلغ من السيد ${ContactClass.paynames.text} امانة عندي اعيده له متى طلب مني ذلك واعترافا باستلامي الأمانة المذكورة وقعت هذا الوصل بتاريخ $formattedDateTime .

''',
                                  'الشاهد  \n الاسم \n${ContactClass.useraddress.text}',
                                  'الشاهد  \n الاسم \n${ContactClass.laweyrsname.text}',
                                  'الاســـــــــم : ${ContactClass.customernames.text} \nرقم الهوية : ${ContactClass.customerIDNo.text} \nتاريـخـهـــا : ${ContactClass.customernos.text} \nعن إقــرار : ${ContactClass.department.text} \nالــعــنـوان : ${ContactClass.customeraddress.text}',
                                  '',
                                  '',
                                  15);
                            })),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
