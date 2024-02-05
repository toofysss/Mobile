import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/services.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customtext.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomText(
                    color: Root.primary,
                    data: "5".tr,
                    size: Root.headersize,
                    textOverflow: TextOverflow.clip),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.only(top: 5),
                child: Column(
                    children: List.generate(
                  ServicesSection.servicesList.length,
                  (index) => GestureDetector(
                      onTap: ServicesSection.servicesList[index].ontap,
                      child: SizedBox(
                        width: Get.width,
                        child: CustomCardLaw(
                          widget: Center(
                            child: CustomText(
                              color: Colors.white,
                              data: ServicesSection.servicesList[index].title,
                              size: Root.textsize,
                              textOverflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      )),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
