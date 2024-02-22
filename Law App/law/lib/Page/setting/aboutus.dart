import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customtext.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CustomText(
              color: Theme.of(context).appBarTheme.foregroundColor!,
              data: "220".tr,
              size: Get.width / 20,
              textOverflow: TextOverflow.ellipsis),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const BackPageButton(),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Root.logo), fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Center(
                  child: CustomText(
                      color: Theme.of(context).appBarTheme.foregroundColor!,
                      data: "Gravity Space",
                      size: Get.width / 16,
                      textOverflow: TextOverflow.clip),
                ),
              ),
              Center(
                child: CustomText(
                    color: Theme.of(context).appBarTheme.foregroundColor!,
                    data: "${"221".tr} 1.3",
                    size: Get.width / 20,
                    textOverflow: TextOverflow.clip),
              ),
            ],
          ),
        ),
      
    );
  }
}
