import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customtext.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.backgroundApp,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CustomText(
              color: Root.primary,
              data: "220".tr,
              size: Root.headersize,
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
                      color: Root.primary,
                      data: "Gravity Space",
                      size: Root.headersize + 5,
                      textOverflow: TextOverflow.clip),
                ),
              ),
              Center(
                child: CustomText(
                    color: Root.primary,
                    data: "${"221".tr} 1.3",
                    size: Root.headersize + 5,
                    textOverflow: TextOverflow.clip),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
