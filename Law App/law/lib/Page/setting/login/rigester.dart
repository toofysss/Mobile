import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:law/Data/goverment.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:http/http.dart' as http;

class RigesterController extends GetxController {
  TextEditingController name = TextEditingController();
  String gender = "62".tr;
  TextEditingController depart = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController govermentID = TextEditingController();
  String goverment = "67".tr;
  TextEditingController phone = TextEditingController();
  TextEditingController room = TextEditingController();
  TextEditingController dscrp = TextEditingController();
  TextEditingController rating = TextEditingController();
  File? img;
  File? imgcardlaw;

  pickimg() async {
    FocusScope.of(Get.context!).unfocus();
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    img = File(result.path);
    Get.forceAppUpdate();
    AlertClass.upload();
  }

  pickCardLaw() async {
    FocusScope.of(Get.context!).unfocus();
    var result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    imgcardlaw = File(result.path);
    Get.forceAppUpdate();
    AlertClass.upload();
  }

  rigester() async {
    if (imgcardlaw == null || img == null) {
      return AlertClass.warning("187".tr);
    } else if (name.text.isEmpty &&
        gender.isEmpty &&
        depart.text.isEmpty &&
        city.text.isEmpty &&
        govermentID.text.isEmpty &&
        room.text.isEmpty &&
        dscrp.text.isEmpty) {
      return AlertClass.warning("51".tr);
    }
    AlertClass.waiting();

    var url = Uri.parse('${ApiClass.api}/LaweysControll/InsertLaweys');
    var request = http.MultipartRequest("POST", url);
    request.fields["ID"] = "0";
    request.fields["Name"] = name.text;
    request.fields["Gender"] = gender == "63".tr ? "0" : "1";
    request.fields["Depart"] = depart.text;
    request.fields["City"] = city.text;
    request.fields["CityID"] = govermentID.text;
    request.fields["Phone"] = phone.text;
    request.fields["Room"] = room.text;
    request.fields["Dscrp"] = dscrp.text;
    request.fields["Rating"] = "0";
    request.fields["Img"] = "";
    request.fields["Imgcardlaw"] = "";
    request.fields["Status"] = "0";

    // Add the image file
    var file = await http.MultipartFile.fromPath(
      "img",
      img!.path,
    );
    var file2 = await http.MultipartFile.fromPath(
      "imgCardLaw",
      imgcardlaw!.path,
    );
    request.files.add(file);
    request.files.add(file2);

    var response = await request.send();
    if (response.statusCode == 200) {
      // clear();
      return AlertClass.success("48".tr);
    } else {
      return AlertClass.error("50".tr);
    }
  }
}

class Rigester extends StatelessWidget {
  const Rigester({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RigesterController>(
        init: RigesterController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: const BackPageButton()),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  ImgRigester
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: 200,
                        width: 200,
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(Root.logo),
                                  fit: BoxFit.fill)),
                        )),
                      ),
                    ), // Rigester Text
                    Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomText(
                          data: "56".tr,
                          size: Root.headersize,
                          color: Theme.of(context).appBarTheme.foregroundColor!,
                          textOverflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    // Name
                    Container(
                      width: Get.width * .9,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomTextField(
                        controller: controller.name,
                        textInputType: TextInputType.emailAddress,
                        hints: '61'.tr,
                        maxline: 1,
                      ),
                    ),
                    // Department
                    Container(
                      width: Get.width * .9,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomTextField(
                        controller: controller.depart,
                        textInputType: TextInputType.emailAddress,
                        hints: '65'.tr,
                        maxline: 1,
                      ),
                    ),
                    // Room Law
                    Container(
                      width: Get.width * .9,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomTextField(
                        controller: controller.room,
                        textInputType: TextInputType.name,
                        hints: '72'.tr,
                        maxline: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Phone Number
                        Container(
                          width: Get.width * .5,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: CustomTextField(
                            controller: controller.phone,
                            textInputType: TextInputType.number,
                            hints: '71'.tr,
                            maxline: 1,
                          ),
                        ),
                        // Gender

                        Container(
                          width: Get.width * .3,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).indicatorColor,
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).indicatorColor,
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
                                iconEnabledColor:
                                    Theme.of(context).indicatorColor,
                                iconDisabledColor:
                                    Theme.of(context).indicatorColor,
                                borderRadius: BorderRadius.circular(25),
                                hint: Center(
                                  child: CustomText(
                                    color: Theme.of(context).indicatorColor,
                                    data: controller.gender,
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip,
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.gender = "$value";
                                  Get.forceAppUpdate();
                                },
                                items: [
                                  "63".tr,
                                  "64".tr,
                                ]
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                                value: value,
                                                child: Center(
                                                  child: CustomText(
                                                      color: Theme.of(context)
                                                          .indicatorColor,
                                                      data: value,
                                                      textOverflow:
                                                          TextOverflow.clip,
                                                      size: Root.textsize),
                                                )))
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //  Goverment
                        Container(
                            width: Get.width * 0.4,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context).indicatorColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).indicatorColor,
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
                                  iconEnabledColor:
                                      Theme.of(context).indicatorColor,
                                  iconDisabledColor:
                                      Theme.of(context).indicatorColor,
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
                                                  textOverflow:
                                                      TextOverflow.clip,
                                                  size: Root.textsize)))
                                      .toList(),
                                ),
                              ),
                            )),
                        // City
                        Container(
                          width: Get.width * .4,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: CustomTextField(
                            controller: controller.city,
                            textInputType: TextInputType.emailAddress,
                            hints: '66'.tr,
                            maxline: 1,
                          ),
                        ),
                      ],
                    ),
                    // Dscrp
                    Container(
                      width: Get.width * .9,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomTextField(
                        controller: controller.dscrp,
                        textInputType: TextInputType.name,
                        hints: '86'.tr,
                        maxline: 3,
                      ),
                    ),
                    // Laweyrs Img
                    Container(
                      width: Get.width * .8,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomButton(
                          data: "70".tr, ontap: () => controller.pickimg()),
                    ),
                    // Card Img
                    Container(
                      width: Get.width * .8,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomButton(
                          data: "69".tr, ontap: () => controller.pickCardLaw()),
                    ),
                    // Rigester
                    Container(
                      width: Get.width * .8,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomButton(
                          data: "56".tr, ontap: () => controller.rigester()),
                    ),
                  ],
                ),
              ));
        });
  }
}
