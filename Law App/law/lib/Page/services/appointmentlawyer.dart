import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/services.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

// توكيل محامي
class AppointmentLawyer extends StatelessWidget {
  const AppointmentLawyer({super.key});

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
                  data: "12".tr,
                  size: Root.headersize,
                  textOverflow: TextOverflow.clip),
              leading: const BackPageButton()),
          body: Directionality(
            textDirection: LanguageClass.lang.text == "English"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: SingleChildScrollView(
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
                        textInputType: TextInputType.name,
                        controller: AppointmentLawyerClass.coverment,
                        hints: "34".tr,
                        maxline: 1,
                        maxlength: 100,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: Get.width * .8,
                      child: CustomTextField(
                        onChanged: (s) {},
                        maxline: 1,
                        textInputType: TextInputType.name,
                        controller: AppointmentLawyerClass.department,
                        hints: "35".tr,
                        maxlength: 50,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: Get.width * .8,
                      child: CustomTextField(
                        onChanged: (s) {},
                        maxline: 1,
                        textInputType: TextInputType.name,
                        controller: AppointmentLawyerClass.court,
                        hints: "36".tr,
                        maxlength: 150,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * .8,
                      child: CustomButton(
                          data: "37".tr,
                          ontap: () => AppointmentLawyerClass.searchlawers()),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
