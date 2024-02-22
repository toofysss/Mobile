import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class LawyersContractController extends GetxController {
  String gender = "183".tr;
  TextEditingController laweyrsname = TextEditingController();
  TextEditingController auctioneername = TextEditingController();
  TextEditingController laweyrsaddress = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController useraddress = TextEditingController();
  TextEditingController usertype = TextEditingController();
  TextEditingController types = TextEditingController();
  TextEditingController total = TextEditingController();
  String currency = "213".tr;
  TextEditingController dscrp = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController lawname = TextEditingController();
  TextEditingController lawend = TextEditingController();
  String paymentway = "115".tr;
}

class LawyersContract extends StatelessWidget {
  final String title;
  const LawyersContract({required this.title, super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LawyersContractController>(
        init: LawyersContractController(),
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
                      width: Get.width * 0.9,
                      margin: const EdgeInsets.only(top: 18),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Material(
                        elevation: 6,
                        shadowColor: Theme.of(context).indicatorColor,
                        borderRadius: BorderRadius.circular(30),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            iconEnabledColor: Theme.of(context).indicatorColor,
                            iconDisabledColor: Theme.of(context).indicatorColor,
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
                              "المحامي",
                              "المحامية",
                            ]
                                .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                          child: CustomText(
                                            color: Theme.of(context)
                                                .indicatorColor,
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
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.laweyrsname,
                          maxline: 1,
                          hints: "97".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.laweyrsaddress,
                          maxline: 1,
                          hints: "98".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.auctioneername,
                          maxline: 1,
                          hints: "160".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.username,
                          maxline: 1,
                          hints: "100".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.useraddress,
                          maxline: 1,
                          hints: "99".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          controller: controller.usertype,
                          maxline: 1,
                          hints: "159".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          controller: controller.types,
                          maxline: 1,
                          hints: "186".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.total,
                          maxline: 1,
                          hints: "101".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      margin: const EdgeInsets.only(top: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).indicatorColor,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Material(
                        elevation: 6,
                        shadowColor: Theme.of(context).indicatorColor,
                        borderRadius: BorderRadius.circular(30),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            iconEnabledColor: Theme.of(context).indicatorColor,
                            iconDisabledColor: Theme.of(context).indicatorColor,
                            borderRadius: BorderRadius.circular(25),
                            hint: Center(
                              child: CustomText(
                                  color: Theme.of(context).indicatorColor,
                                  data: controller.currency,
                                  textOverflow: TextOverflow.clip,
                                  size: Root.textsize),
                            ),
                            onChanged: (value) {
                              controller.currency = "$value";
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
                                            color: Theme.of(context)
                                                .indicatorColor,
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
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.multiline,
                          controller: controller.dscrp,
                          maxline: 10,
                          hints: "104".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.number,
                          controller: controller.price,
                          maxline: 1,
                          hints: "105".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.lawname,
                          maxline: 1,
                          hints: "112".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.lawend,
                          maxline: 1,
                          hints: "114".tr),
                    ),
                    Container(
                      width: Get.width * 0.9,
                      margin: const EdgeInsets.only(top: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).indicatorColor,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Material(
                        elevation: 6,
                        shadowColor: Theme.of(context).indicatorColor,
                        borderRadius: BorderRadius.circular(30),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            iconEnabledColor: Theme.of(context).indicatorColor,
                            iconDisabledColor: Theme.of(context).indicatorColor,
                            borderRadius: BorderRadius.circular(25),
                            hint: Center(
                              child: CustomText(
                                  color: Theme.of(context).indicatorColor,
                                  data: controller.paymentway,
                                  textOverflow: TextOverflow.clip,
                                  size: Root.textsize),
                            ),
                            onChanged: (value) {
                              controller.paymentway = "$value";
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
                                            color: Theme.of(context)
                                                .indicatorColor,
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
                              controller.paymentway == "نقدا"
                                  ? paymentway = controller.paymentway
                                  : paymentway =
                                      'أو يدفع الاتعاب على الشكل التالي ${controller.paymentway}';
                              ContactClass.createPdf(
                                  '(( عقد خاص بأتعاب المحاماة ))',
                                  'استنادا لاحكام قانون المحاماة رقم ١٧٣ لسنة ١٩٦٥ المعدل اتفق الطرفان المتعاقدان على ما يلي : -',
                                  "الطرف الأول ${controller.gender} : ${controller.laweyrsname.text} \n الطرف الثاني : ${controller.username.text} ",
                                  "عنوان المكتب ${controller.laweyrsaddress.text} \n عنوان السكـن ${controller.useraddress.text}",
                                  '''
        1. كلف الطرف الثاني الطرف الأول بالقيام بالأعمال المبينة تفاصيلها ادناء و وافق على دفع كامل اتعاب المحاماة له ومقدارها ${controller.total.text} ${controller.currency}
        2. ان الاعمال المكلف بها الطرف الأول هي ${controller.dscrp.text}
        3 . يقر الطرف الأول بأنه قبض من الطرف الثاني مبلغاً مقداره ${controller.price.text} عند التوقيع على هذا العقد كمقدمة للأتعاب المذكورة اعلاه وتصبح حقا مقرراً له مهما كانت نتيجة الاعمال المكلف بها ويتعهد الطرف الثاني بأنه ملزم بدفع كامل الاتعاب الى الطرف الاول حال صدور قرار الحكم من محكمة ${controller.lawname.text}  في الاعمال المبينة اعلاه $paymentway
        4 . اذا انهي الطرف الأول الاعمال المكلف بها اعلاه صلحا او تحكيماً أو بأي سبب او طريقة أخرى وفق ما فوضه به الطرف الثاني  فأن الطرف الأول يستحق كامل اتعابة .
        5 . اذا قام الطرف الثاني بعزل الطرف الاول المحامي أو منعه من الاستمرار في عمله بعد المباشرة فيه بدون سبب مشروع او اذا تنازل عن الدعوى وعن حقة او تصالح مع الخصم خارج المحكمة أو ابطل عريضتها أو صدور قرار عفو عام أو خاص في الدعاوي الجزائية فان الطرف الأول يستحق كامل الاتعاب كما لو كان انهى العمل اصوليا .
        6 . يتعهد الطرف الأول ببذل الجهد والعناية المعتادة للمحافظة على حقوق ومصلحة الطرف الثاني والاستمرار في متابعة العمل المكلف به إلى آخر مراحلها القانونية حسمها وانجازها ولا يكون ملزماً  بتحقيق النتيجة التي يبتغيها الطرف الثاني بل ما يقرره القانون .
        7 . ان الالتزامات الواردة في هذا العقد تنحصر على الاعمال المتفق عليها والمبينة تفاصيلها اعلاه فقط اما اذا تفرعت اعمال جديدة غير ما اتفق عليه ولم تكن ملحوظة وقت الاتفاق فأن الطرف الثاني ملزم بدفع اتعاب جديدة عنها إلى الطرف الأول عند تكليفه بها وبموجب اتفاق جديد بينهما .
        8 . يلتزم الطرف الثاني بتهيئة كافة المستندات والبيانات الضرورية المقتضية وتقديمها إلى الطرف الأول الذي بدوره يسلمها إلى المحكمة او أي جهة مختصة ولا يتحمل المسؤولية في حال ثبت عدم صحتها او تزويرها ومنها ما يطرأ على عنوان محل اقامته أو عمله او على رقم الهاتف من تغيير او تبديل كما يلتزم من جانبه في اجراء كافة التبليغات القانونية المقتضية لخصمه . 
        9 . يتحمل الطرف الثاني كافة الرسوم القانونية ومنها رسوم الدعاوى والتنفيذ ورسوم الطابع عن العقود والمكاتبات والكمبيالات و وصولات الامانه او الغرامات وغيرها من الرسوم القانونية او المستندات الخاصة بالطرف الثاني واجور الكشف والخبراء واجور نقلهم والمصاريف الأخرى التي تستلزمها الاعمال المنوه عنها اعلاه وكذلك نفقات السفر لمتابعة الاعمال المكلف بها خارج المحافظة اوخارج العراق . 
        10 . يعتبر العقد مفسوخا من تلقاء نفسه دون الحاجة الى انذار رسمي أو حكم قضائي عند اخلال الطرف الثاني بالالتزامات المترتبة عليه ويكون ملزما بتأديه للطرف الأول كامل الاتعاب المتفق عليها .
        11. اذا اختلف الطرفان حول تنفيذ بنود العقد فتكون محكمة ${controller.lawend.text} هي المختصة بالنظر فيه .
        حرر بنسختين في $formattedDateTime.''',
                                  "الطرف الأول \n ${controller.gender} : ${controller.laweyrsname.text} \n الصلاحية ${controller.auctioneername.text} \n",
                                  "الطرف الثاني \nالاسم الثلاثي: ${controller.username.text} \nالمعرف بالهوية: ${controller.usertype.text} \nجهة الاصدار : ${controller.types.text} ",
                                  '',
                                  '',
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
