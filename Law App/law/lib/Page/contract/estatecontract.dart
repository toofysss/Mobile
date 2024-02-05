import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class EstateContract extends StatefulWidget {
  final String title;
  const EstateContract({required this.title, super.key});
  @override
  State<EstateContract> createState() => _EstateContractState();
}

class _EstateContractState extends State<EstateContract> {
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
                                controller: ContactClass.payname,
                                maxline: 1,
                                maxlength: 1,
                                hints: "117".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.payahalla,
                                maxline: 1,
                                maxlength: 1,
                                hints: "118".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.payalley,
                                maxline: 1,
                                maxlength: 1,
                                hints: "119".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.payhome,
                                maxline: 1,
                                maxlength: 1,
                                hints: "120".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.paytype,
                                maxline: 1,
                                maxlength: 1,
                                hints: "122".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.payno,
                                maxline: 1,
                                maxlength: 1,
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
                                controller: ContactClass.username,
                                maxline: 1,
                                maxlength: 1,
                                hints: "121".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.userahalla,
                                maxline: 1,
                                maxlength: 1,
                                hints: "118".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.useralley,
                                maxline: 1,
                                maxlength: 1,
                                hints: "119".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.userhome,
                                maxline: 1,
                                maxlength: 1,
                                hints: "120".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.usertype,
                                maxline: 1,
                                maxlength: 1,
                                hints: "122".tr),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CustomTextField(
                                textInputType: TextInputType.name,
                                onChanged: (s) {},
                                controller: ContactClass.userno,
                                maxline: 1,
                                maxlength: 1,
                                hints: "123".tr),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.laweyrsname,
                          maxline: 1,
                          maxlength: 1,
                          hints: "126".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.laweyrsaddress,
                          maxline: 1,
                          maxlength: 1,
                          hints: "127".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.useraddress,
                          maxline: 1,
                          maxlength: 1,
                          hints: "128".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.total,
                          maxline: 2,
                          maxlength: 1,
                          hints: "129".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.dscrp,
                          maxline: 1,
                          maxlength: 1,
                          hints: "130".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.carResidual,
                          maxline: 1,
                          maxlength: 1,
                          hints: "216".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.cartype,
                          maxline: 1,
                          maxlength: 1,
                          hints: "217".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.price,
                          maxline: 1,
                          maxlength: 1,
                          hints: "137".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.lawname,
                          maxline: 1,
                          maxlength: 1,
                          hints: "131".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.paymentway,
                          maxline: 1,
                          maxlength: 1,
                          hints: "134".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.auctioneername,
                          maxline: 1,
                          maxlength: 1,
                          hints: "135".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.moredetails,
                          maxline: 1,
                          maxlength: 1,
                          hints: "136".tr),
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
                              String price2 =
                                  Tafqeet.convert(ContactClass.lawname.text);
                              ContactClass.createEstatePdf(
                                  'عقد بيع العقار',
                                  '',
                                  "الطرف الأول ( البــائـــع ) ${ContactClass.payname.text} \n العنوان م ${ContactClass.payahalla.text} ز ${ContactClass.payalley.text} د ${ContactClass.payhome.text} \nالمعرف بالهوية نوع ${ContactClass.paytype.text} المرقمة ${ContactClass.payno.text}"
                                      "\n"
                                      "الطرف الثاني ( المشتري ) ${ContactClass.username.text}\n العنوان م ${ContactClass.userahalla.text}ز ${ContactClass.useralley.text}  د ${ContactClass.userhome.text} \nالمعرف بالهوية نوع ${ContactClass.usertype.text} المرقمة ${ContactClass.userno.text}",
                                  "",
                                  ""
                                      '''
أولا::  يعترف الطرف الأول بأنه قد باع الى الطرف الثاني الملك المفصل فيما يلي:-
نوع الملك ${ContactClass.laweyrsname.text}
الرقم والتسلسل ${ContactClass.laweyrsaddress.text}
عنوان الملك المحلة ${ContactClass.useraddress.text} زقاق ${ContactClass.total.text} دار ${ContactClass.dscrp.text}
ثانيا :: أن بدل البيع المتفق عليه هو ( ${ContactClass.price.text} )  ( $price )  ${ContactClass.gender}.
ثالثا :: يعترف الطرف الأول بأنه قد قبض من الطرف الثاني عربونا وقدره ( ${ContactClass.lawname.text} )  ( $price2 ) ${ContactClass.gender} واما باقي المبلغ فيدفع عند اكمال المعاملة و التقرير في دائرة التسجيل العقاري .
رابعا::  اذا امتنع أي من الطرفين عن تنفيذ شروط هذا العقد ( النكول) يكون ملزما بدفع ضعف مبلغ العربون الى الطرف الآخر دون الحاجه الى انذار رسمي .
خامسا :: ان  المقتضية للبيع ${ContactClass.carResidual.text} هي على عاتق الطرف الاول البائع  ${ContactClass.cartype.text} على عاتق الطرف الثاني المشتري
٦. يتعهد الطرفان بأن يدفع كل واحد منهما دلالية قدرها ( ${ContactClass.paymentway.text} ) بالمائة الى الدلال ${ContactClass.auctioneername.text} الذي توسط بعقد البيع بمجرد التوقيع على هذا العقد ولا تعاد في حالة اختلاف الطرفين .
بناء على حصول التراضي والقبول حرر هذا العقد بتاريخ  $formattedDateTime
فقرات إضافية : ${ContactClass.moredetails.text}
''',
                                  'الطرف الاول ( البائع ) :${ContactClass.payname.text} \n ',
                                  'الطرف الثاني ( المشتري ) :${ContactClass.username.text} \n ',
                                  '',
                                  '',
                                  'الشاهد الأول',
                                  'الشاهد الثاني');
                            })),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
