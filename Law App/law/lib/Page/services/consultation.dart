import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/services.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

// استشارة قانونية
class Consultation extends StatelessWidget {
  final String userID;
  const Consultation({required this.userID, super.key});

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
                  data: "11".tr,
                  size: Root.headersize,
                  textOverflow: TextOverflow.ellipsis),
              leading: const BackPageButton()),
          body: Directionality(
            textDirection: LanguageClass.lang.text == "English"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.streetAddress,
                          controller: ConsultationClass.address,
                          hints: "39".tr,
                          maxline: 1,
                          maxlength: 150,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.number,
                          controller: ConsultationClass.whatsapp,
                          hints: "42".tr,
                          maxline: 1,
                          maxlength: 11,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          maxlength: 150,
                          textInputType: TextInputType.name,
                          controller: ConsultationClass.type,
                          hints: "38".tr,
                          maxline: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.multiline,
                          controller: ConsultationClass.dscrp,
                          hints: "40".tr,
                          maxline: 10,
                          maxlength: 5000,
                        ),
                      ),
                      // المرفقات
                      Container(
                          width: Get.width * .8,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomButton(
                              data: "41".tr,
                              ontap: () => ConsultationClass.pickfile())),
                      //  Send Btn
                      Container(
                          width: Get.width * .8,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomButton(
                              data: "43".tr,
                              ontap: () => ConsultationClass.sendfile(userID)))
                    ]),
              ),
            ),
          ),
        ));
  }
}
