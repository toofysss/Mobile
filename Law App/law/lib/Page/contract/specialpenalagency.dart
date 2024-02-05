import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class SpecialPenalAgency extends StatelessWidget {
  final String title;
  const SpecialPenalAgency({required this.title, super.key});

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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.laweyrsname,
                          maxline: 1,
                          maxlength: 1,
                          hints: "162".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.username,
                          maxline: 1,
                          maxlength: 1,
                          hints: "163".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.laweyrsaddress,
                          maxline: 1,
                          maxlength: 1,
                          hints: "164".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.price,
                          maxline: 1,
                          maxlength: 1,
                          hints: "165".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.lawname,
                          maxline: 1,
                          maxlength: 1,
                          hints: "112".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.total,
                          maxline: 1,
                          maxlength: 1,
                          hints: "166".tr),
                    ),
                    Container(
                        width: Get.width * .8,
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: CustomButton(
                            data: "107".tr,
                            ontap: () {
                              ContactClass.createPdf(
                                  'وكالة جزائية خاصة',
                                  " الوكيل : ${ContactClass.laweyrsname.text} \n الموكل : ${ContactClass.username.text} \n الخصم : ${ContactClass.laweyrsaddress.text} \n نوع الدعوى : جزائية \n رقم الدعوى : ${ContactClass.price.text} \n أسم المحكمة : ${ContactClass.lawname.text}",
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '\n الصلاحيات \n'
                                      "أني الموقع أدناه قد وكلت المحامي (${ContactClass.laweyrsname.text}) وفقأ للمادة (${ContactClass.total.text}) من قانون العقوبات في الشكوى المقامة المذكورة أعلاه وقد أذنت للمومى اليه بتعقيب الدعوى والترافع فيها الى اخر درجات المحاكم تحقيقأ وجنح وأمام محكمة الجنايات ومحكمة الاستئناف ( بصفتها التميزية ) ومحكمة التمييز الاتحادية سواء بقيت الشكوى وفقا للمادة المذكورة أعلاه او تغيرت او أضيفت اليها تهما أخرى اليها استنادأ لنفس الوقائع فله حق الحضور في التحقيقات الأولية ومراجعة محكمة التحقيق وطلب الافراج والكفالة وتقديم كافة البيانات القانونية وتقديم الدفاع وتقديم كافة العرائض واللوائح بتوقيعه وتقديم شهود الدفاع وطلب نقل الدعوى من الادارة الى المحكمة وبالعكس في كل ما مر ذكره من الصلاحيات ومجمل القول أن للوكيل الموما اليه كافة الحقوق والصلاحيات التي أملكها في هذه الدعوى"
                                      ' \n  وللبيان وقعت',
                                  '\n املتهم',
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
