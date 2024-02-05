import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class MarriedContract extends StatelessWidget {
  final String title;
  const MarriedContract({required this.title, super.key});

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
                data: title,
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
                                onChanged: (s) {},
                                controller: ContactClass.payname,
                                maxline: 1,
                                maxlength: 1,
                                hints: "139".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.payahalla,
                                maxline: 1,
                                maxlength: 1,
                                hints: "141".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.payalley,
                                maxline: 1,
                                maxlength: 1,
                                hints: "142".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.payhome,
                                maxline: 1,
                                maxlength: 1,
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
                                onChanged: (s) {},
                                controller: ContactClass.username,
                                maxline: 1,
                                maxlength: 1,
                                hints: "140".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.userahalla,
                                maxline: 1,
                                maxlength: 1,
                                hints: "141".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.useralley,
                                maxline: 1,
                                maxlength: 1,
                                hints: "176".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.userhome,
                                maxline: 1,
                                maxlength: 1,
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
                                onChanged: (s) {},
                                controller: ContactClass.laweyrsname,
                                maxline: 1,
                                maxlength: 1,
                                hints: "148".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.laweyrsaddress,
                                maxline: 1,
                                maxlength: 1,
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
                                onChanged: (s) {},
                                controller: ContactClass.useraddress,
                                maxline: 1,
                                maxlength: 1,
                                hints: "148".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.total,
                                maxline: 1,
                                maxlength: 1,
                                hints: "143".tr),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.dscrp,
                          maxline: 1,
                          maxlength: 1,
                          hints: "149".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.price,
                          maxline: 1,
                          maxlength: 1,
                          hints: "150".tr),
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
                                  data: ContactClass.married,
                                  textOverflow: TextOverflow.clip,
                                  size: Root.textsize),
                            ),
                            onChanged: (value) {
                              ContactClass.married = "$value";
                              Get.appUpdate();
                              Get.forceAppUpdate();
                            },
                            items: [
                              "عند المطالبة والميسرة",
                              "عند اقرب الأجلين",
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
                              String dscrp =
                                  Tafqeet.convert(ContactClass.dscrp.text);
                              String price =
                                  Tafqeet.convert(ContactClass.price.text);
                              ContactClass.createPdf(
                                  'بسم الله الرحمن الرحيم \n (( ورقة عقد الزواج )) ',
                                  'ومن اياته ان خلق لكم من أنفسكم ازاجا لتسكنوا اليها وجعل بينكم مودة ورحمة صدق الله العلي العظيم  .\nلقــــــد حضـــــر الزوج المســمى ( ${ContactClass.payname.text}  ) وطلــــــــــب تنظيم مستند زواج  على زوجتـــــــــــــــه   (   ${ContactClass.username.text}   ) \nوهما بكامل قواهما العقلية والنفسية وعلى الاتفاق الحاصل بينهما على تسمية المهرين المعجل المؤجل و كالاتي\nالمهر المعجل ( ${ContactClass.dscrp.text} ) $dscrp المهر المؤجل (${ContactClass.price.text}) $price  يستحق  ${ContactClass.married} .\n تم العقد بتاريخ    $formattedDateTime',
                                  'إقرار الزوج \n الاسم : ${ContactClass.username.text} \n الحالة الزوجية : ${ContactClass.userahalla.text} \n المعرف : ${ContactClass.useralley.text} \n العنوان : ${ContactClass.userhome.text} \n \n \n ',
                                  'إقرار الزوجة \n الاسم : ${ContactClass.payname.text} \n الحالة الزوجية : ${ContactClass.payahalla.text} \n المعرفة : ${ContactClass.payalley.text} \n العنوان : ${ContactClass.payhome.text} ',
                                  '\n',
                                  'الشاهد الأول البالغ سن الرشد \n الاسم :${ContactClass.useraddress.text} \n العنوان : ${ContactClass.total.text} ',
                                  'الشاهد الثاني البالغ سن الرشد \n الاسم :${ContactClass.laweyrsname.text} \n العنوان : ${ContactClass.laweyrsaddress.text} ',
                                  '',
                                  '\n المستمع لصيغة الطلاق',
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
