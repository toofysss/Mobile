import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class LawyersContract extends StatefulWidget {
  final String title;
  const LawyersContract({required this.title, super.key});
  @override
  State<LawyersContract> createState() => _LawyersContractState();
}

class _LawyersContractState extends State<LawyersContract> {
  @override
  void initState() {
    ContactClass.married = "213".tr;
    ContactClass.paymentway.text = '115'.tr;
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
                              "المحامي",
                              "المحامية",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.laweyrsname,
                          maxline: 1,
                          maxlength: 1,
                          hints: "97".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.laweyrsaddress,
                          maxline: 1,
                          maxlength: 1,
                          hints: "98".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.auctioneername,
                          maxline: 1,
                          maxlength: 1,
                          hints: "160".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.username,
                          maxline: 1,
                          maxlength: 1,
                          hints: "100".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.useraddress,
                          maxline: 1,
                          maxlength: 1,
                          hints: "99".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.usertype,
                          maxline: 1,
                          maxlength: 1,
                          hints: "159".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.carNo,
                          maxline: 1,
                          maxlength: 1,
                          hints: "186".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.total,
                          maxline: 1,
                          maxlength: 1,
                          hints: "101".tr),
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
                              "دينار عراقي",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.multiline,
                          onChanged: (s) {},
                          controller: ContactClass.dscrp,
                          maxline: 10,
                          maxlength: 1,
                          hints: "104".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          onChanged: (s) {},
                          controller: ContactClass.price,
                          maxline: 1,
                          maxlength: 1,
                          hints: "105".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.lawname,
                          maxline: 1,
                          maxlength: 1,
                          hints: "112".tr),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          onChanged: (s) {},
                          controller: ContactClass.lawend,
                          maxline: 1,
                          maxlength: 1,
                          hints: "114".tr),
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
                                  data: ContactClass.paymentway.text,
                                  textOverflow: TextOverflow.clip,
                                  size: Root.textsize),
                            ),
                            onChanged: (value) {
                              ContactClass.paymentway.text = "$value";
                              Get.appUpdate();
                              Get.forceAppUpdate();
                            },
                            items: [
                              "نقدا",
                              "على شكل دفعتين",
                              "على شكل ثلاثة دفعات",
                              "على شكل اربعة دفعات",
                              "على شكل خمسة دفعات",
                              "على شكل ستة دفعات",
                              "على شكل سبعة دفعات",
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
                              String paymentway = '';
                              ContactClass.paymentway.text == "نقدا"
                                  ? paymentway = ContactClass.paymentway.text
                                  : paymentway =
                                      'أو يدفع الاتعاب على الشكل التالي ${ContactClass.paymentway.text}';
                              ContactClass.createPdf(
                                  '(( عقد خاص بأتعاب المحاماة ))',
                                  'استنادا لاحكام قانون المحاماة رقم ١٧٣ لسنة ١٩٦٥ المعدل اتفق الطرفان المتعاقدان على ما يلي : -',
                                  "الطرف الأول ${ContactClass.gender} : ${ContactClass.laweyrsname.text} \n الطرف الثاني : ${ContactClass.username.text} ",
                                  "عنوان المكتب ${ContactClass.laweyrsaddress.text} \n عنوان السكـن ${ContactClass.useraddress.text}",
                                  '''
1. كلف الطرف الثاني الطرف الأول بالقيام بالأعمال المبينة تفاصيلها ادناء و وافق على دفع كامل اتعاب المحاماة له ومقدارها ${ContactClass.total.text} ${ContactClass.married}
2. ان الاعمال المكلف بها الطرف الأول هي ${ContactClass.dscrp.text}
3 . يقر الطرف الأول بأنه قبض من الطرف الثاني مبلغاً مقداره ${ContactClass.price.text} عند التوقيع على هذا العقد كمقدمة للأتعاب المذكورة اعلاه وتصبح حقا مقرراً له مهما كانت نتيجة الاعمال المكلف بها ويتعهد الطرف الثاني بأنه ملزم بدفع كامل الاتعاب الى الطرف الاول حال صدور قرار الحكم من محكمة ${ContactClass.lawname.text}  في الاعمال المبينة اعلاه $paymentway
4 . اذا انهي الطرف الأول الاعمال المكلف بها اعلاه صلحا او تحكيماً أو بأي سبب او طريقة أخرى وفق ما فوضه به الطرف الثاني  فأن الطرف الأول يستحق كامل اتعابة .
5 . اذا قام الطرف الثاني بعزل الطرف الاول المحامي أو منعه من الاستمرار في عمله بعد المباشرة فيه بدون سبب مشروع او اذا تنازل عن الدعوى وعن حقة او تصالح مع الخصم خارج المحكمة أو ابطل عريضتها أو صدور قرار عفو عام أو خاص في الدعاوي الجزائية فان الطرف الأول يستحق كامل الاتعاب كما لو كان انهى العمل اصوليا .
6 . يتعهد الطرف الأول ببذل الجهد والعناية المعتادة للمحافظة على حقوق ومصلحة الطرف الثاني والاستمرار في متابعة العمل المكلف به إلى آخر مراحلها القانونية حسمها وانجازها ولا يكون ملزماً  بتحقيق النتيجة التي يبتغيها الطرف الثاني بل ما يقرره القانون .
7 . ان الالتزامات الواردة في هذا العقد تنحصر على الاعمال المتفق عليها والمبينة تفاصيلها اعلاه فقط اما اذا تفرعت اعمال جديدة غير ما اتفق عليه ولم تكن ملحوظة وقت الاتفاق فأن الطرف الثاني ملزم بدفع اتعاب جديدة عنها إلى الطرف الأول عند تكليفه بها وبموجب اتفاق جديد بينهما .
8 . يلتزم الطرف الثاني بتهيئة كافة المستندات والبيانات الضرورية المقتضية وتقديمها إلى الطرف الأول الذي بدوره يسلمها إلى المحكمة او أي جهة مختصة ولا يتحمل المسؤولية في حال ثبت عدم صحتها او تزويرها ومنها ما يطرأ على عنوان محل اقامته أو عمله او على رقم الهاتف من تغيير او تبديل كما يلتزم من جانبه في اجراء كافة التبليغات القانونية المقتضية لخصمه . 
9 . يتحمل الطرف الثاني كافة الرسوم القانونية ومنها رسوم الدعاوى والتنفيذ ورسوم الطابع عن العقود والمكاتبات والكمبيالات و وصولات الامانه او الغرامات وغيرها من الرسوم القانونية او المستندات الخاصة بالطرف الثاني واجور الكشف والخبراء واجور نقلهم والمصاريف الأخرى التي تستلزمها الاعمال المنوه عنها اعلاه وكذلك نفقات السفر لمتابعة الاعمال المكلف بها خارج المحافظة اوخارج العراق . 
10 . يعتبر العقد مفسوخا من تلقاء نفسه دون الحاجة الى انذار رسمي أو حكم قضائي عند اخلال الطرف الثاني بالالتزامات المترتبة عليه ويكون ملزما بتأديه للطرف الأول كامل الاتعاب المتفق عليها .
11. اذا اختلف الطرفان حول تنفيذ بنود العقد فتكون محكمة ${ContactClass.lawend.text} هي المختصة بالنظر فيه .
حرر بنسختين في $formattedDateTime.''',
                                  "الطرف الأول \n ${ContactClass.gender} : ${ContactClass.laweyrsname.text} \n الصلاحية ${ContactClass.auctioneername.text} \n",
                                  "الطرف الثاني \nالاسم الثلاثي: ${ContactClass.username.text} \nالمعرف بالهوية: ${ContactClass.usertype.text} \nجهة الاصدار : ${ContactClass.carNo.text} ",
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
