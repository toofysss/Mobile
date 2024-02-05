import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class RevocableDivorce extends StatelessWidget {
  final String title;
  const RevocableDivorce({required this.title, super.key});

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
                          hints: "152".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.price,
                          maxline: 1,
                          maxlength: 1,
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
                                  "الحمد لله الذي شرع واحل الطلاق لحسم النزاع وجعله نوعاً من أنواع المصالحة للعباد حيث قال الرسول الأمين (ص) ( الطلاق بين من اخذ بالساق ) وصل الله على محمد وعلى اله وصحبه إلى يـــــــــــــــوم الديـــــــن . وبعــــــــــــــد لقــــــــــد حضـــــــــــــــــر الرجـــــــــــــــــل المســـــــــــــــــــــــمى (${ContactClass.payname.text}) وطلــــــــــب طـــــلاق زوجتـــــــــــــــه      (${ContactClass.username.text}) وهو بكامل قواه العقلية وبعد الإرشاد والنصيحة فأصر على الطـــــــــلاق الرجعي وذلك لعــــــدم انسجام الحياة الزوجية بينهم وأجاب الزوج قائلاً زوجتي (${ContactClass.price.text}) طالق طلقة رجعية واحدة بشهادة الله والحاضرين والله على كل شيء شهيد ... علماً إن الزوجة غائبة من محضر الطلاق .",
                                  'إقرار الزوج \n الاسم : ${ContactClass.username.text} \n الحالة الزوجية : ${ContactClass.userahalla.text} \n المعرف : ${ContactClass.useralley.text} \n العنوان : ${ContactClass.userhome.text} \n \n \n ',
                                  'إقرار الزوجة \n الاسم : ${ContactClass.payname.text} \n الحالة الزوجية : ${ContactClass.payahalla.text} \n المعرفة : ${ContactClass.payalley.text} \n العنوان : ${ContactClass.payhome.text} ',
                                  '\n',
                                  'الشاهد الأول البالغ سن الرشد \n الاسم :${ContactClass.useraddress.text} \n العنوان : ${ContactClass.total.text} ',
                                  'الشاهد الثاني البالغ سن الرشد \n الاسم :${ContactClass.laweyrsname.text} \n العنوان : ${ContactClass.laweyrsaddress.text} ',
                                  'ملاحظة : إفادة الزوج إن زوجته في حالة طهر يصح الطـلاق  وان الطلاق للمرة (${ContactClass.dscrp.text}) \nكما تعهد الزوج بدفع كافة حقوق زوجته الشرعية والله خير الشاهدين \nوله حق الرجـوع إلى زوجته إثناء فترة العدة الشرعية البالغة ثلاثة أشهـر مـن تاريخ الطلاق وإنها متروكة الفراش ',
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
