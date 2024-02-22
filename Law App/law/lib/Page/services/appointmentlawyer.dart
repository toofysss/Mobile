import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/goverment.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Page/Section/layers.dart';
import 'package:law/contant/config.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:http/http.dart' as http;

// توكيل محامي
class AppointmentLawyerController extends GetxController {
  TextEditingController govermentID = TextEditingController();
  String goverment = "67".tr;
  TextEditingController department = TextEditingController();
  TextEditingController court = TextEditingController();

  searchLawyers() async {
    if (Data.online) {
      if (govermentID.text.isEmpty ||
          department.text.isEmpty ||
          court.text.isEmpty) {
        return AlertClass.warning("51".tr);
      }
      var response = await http.get(
          Uri.parse(
              "${Config.api}/LaweysControll/GetBy?depart=${department.text}&govermentID=${govermentID.text}&room=${court.text}"),
          headers: {"accept": "text/plain"});
      if (response.statusCode == 200) {
        List responsebody = jsonDecode(response.body);
        if (responsebody[0]['details'].isEmpty) {
          return AlertClass.warning("53".tr);
        }
        Get.to(
            () => Layers(
                  data: '12'.tr,
                  id: 0,
                ),
            transition: Transition.fadeIn);
      } else {
        return AlertClass.warning("53".tr);
      }
    } else {
      AlertClass.error("50".tr);
    }
  }
}

class AppointmentLawyer extends StatelessWidget {
  const AppointmentLawyer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentLawyerController>(
      init: AppointmentLawyerController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "12".tr,
              style: TextStyle(
                color: Theme.of(context).appBarTheme.foregroundColor,
                fontSize: Root.textsize,
                overflow: TextOverflow.clip,
              ),
            ),
            leading: const BackPageButton(),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: Get.width * 0.9,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).indicatorColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Material(
                        elevation: 6,
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
                                data: controller.goverment,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip,
                              ),
                            ),
                            onChanged: (value) {
                              controller.goverment = value!;
                              Get.forceAppUpdate();
                            },
                            items: GovermentClass.govermentlist
                                .map<DropdownMenuItem<String>>((value) =>
                                    DropdownMenuItem<String>(
                                        onTap: () {
                                          controller.govermentID.text =
                                              "${value.id}";
                                        },
                                        value: Root.lang == "en"
                                            ? value.cityE
                                            : value.cityA,
                                        child: CustomText(
                                            color: Theme.of(context)
                                                .indicatorColor,
                                            data:
                                                "${Root.lang == "en" ? value.cityE : value.cityA}",
                                            textOverflow: TextOverflow.clip,
                                            size: Root.textsize)))
                                .toList(),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                      maxline: 1,
                      textInputType: TextInputType.name,
                      controller: controller.department,
                      hints: "35".tr,
                    ),
                  ),
                  Container(
                    width: Get.width * 0.9,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomTextField(
                      maxline: 1,
                      textInputType: TextInputType.name,
                      controller: controller.court,
                      hints: "36".tr,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: Get.width * .4,
                    child: CustomButton(
                      data: "37".tr,
                      ontap: () => controller.searchLawyers(),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
