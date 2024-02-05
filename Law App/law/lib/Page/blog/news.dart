import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/services.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Root.backgroundApp,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
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
                      NewsClass.img != null
                          ? GestureDetector(
                              onTap: () => NewsClass.pickfile(),
                              child: Container(
                                width: Get.width * .8,
                                height: 350,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: FileImage(NewsClass.img!),
                                        fit: BoxFit.fill)),
                              ),
                            )
                          : GestureDetector(
                              onTap: () => NewsClass.pickfile(),
                              child: Container(
                                width: Get.width * .8,
                                height: 150,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: CustomText(
                                      color: Root.primary,
                                      data: "77".tr,
                                      size: Root.headersize,
                                      textOverflow: TextOverflow.clip),
                                ),
                              ),
                            ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          maxlength: 150,
                          textInputType: TextInputType.name,
                          controller: NewsClass.title,
                          hints: "75".tr,
                          maxline: 1,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * .8,
                        child: CustomTextField(
                          onChanged: (s) {},
                          textInputType: TextInputType.multiline,
                          controller: NewsClass.dscrp,
                          hints: "76".tr,
                          maxline: 7,
                          maxlength: 5000,
                        ),
                      ),
                      Container(
                          width: Get.width * .8,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: CustomButton(
                              data: "91".tr,
                              ontap: () => NewsClass.selectType()))
                    ]),
              ),
            ),
          ),
        ));
  }
}
