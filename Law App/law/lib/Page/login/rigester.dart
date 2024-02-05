import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/login.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customloading.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:http/http.dart' as http;

class Rigester extends StatefulWidget {
  const Rigester({super.key});

  @override
  State<Rigester> createState() => _RigesterState();
}

class _RigesterState extends State<Rigester> {
  @override
  void initState() {
    RigesterClass.cityID.text = "67".tr;
    RigesterClass.gender.text = "62".tr;
    getgoverment();
    super.initState();
  }

  getgoverment() async {
    RigesterClass.goverment.clear();
    var response = await http.get(
      Uri.parse("${ApiClass.api}/CityControll/GetAll"),
      headers: const {"accept": "*/*"},
    );
    if (response.statusCode == 200) {
      List<dynamic> responsebody = jsonDecode(response.body);
      LanguageClass.lang.text == "English"
          ? RigesterClass.goverment = responsebody.map((item) {
              return DropdownItem('${item['id']}', "${item['dscrpE']}");
            }).toList()
          : RigesterClass.goverment = responsebody.map((item) {
              return DropdownItem('${item['id']}', "${item['dscrp']}");
            }).toList();
      return responsebody;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.backgroundApp,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const BackPageButton()),
        body: Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Center(
            child: FutureBuilder(
                future: getgoverment(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
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
                                color: Root.primary,
                                textOverflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          // Name
                          FlipInY(
                              duration: Root.duration,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: CustomTextField(
                                  onChanged: (s) {},
                                  controller: RigesterClass.name,
                                  textInputType: TextInputType.emailAddress,
                                  hints: '61'.tr,
                                  maxline: 1,
                                  maxlength: 150,
                                ),
                              )),
                          // Department
                          FlipInY(
                              duration: Root.duration,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: CustomTextField(
                                  onChanged: (s) {},
                                  controller: RigesterClass.depart,
                                  textInputType: TextInputType.emailAddress,
                                  hints: '65'.tr,
                                  maxline: 1,
                                  maxlength: 100,
                                ),
                              )),
                          // Room Law
                          FlipInY(
                              duration: Root.duration,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: CustomTextField(
                                  onChanged: (s) {},
                                  controller: RigesterClass.room,
                                  textInputType: TextInputType.name,
                                  hints: '72'.tr,
                                  maxline: 1,
                                  maxlength: 100,
                                ),
                              )),
                          // Phone Number
                          FlipInY(
                              duration: Root.duration,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: CustomTextField(
                                  onChanged: (s) {},
                                  controller: RigesterClass.phone,
                                  textInputType: TextInputType.number,
                                  hints: '71'.tr,
                                  maxline: 1,
                                  maxlength: 15,
                                ),
                              )),
                          // Gender
                          FlipInY(
                              duration: Root.duration,
                              child: Container(
                                width: Get.width * .8,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: Root.primary,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Root.primary,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Material(
                                  elevation: 6,
                                  borderRadius: BorderRadius.circular(30),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      iconEnabledColor: Root.primary,
                                      iconDisabledColor: Root.primary,
                                      borderRadius: BorderRadius.circular(25),
                                      hint: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Center(
                                          child: CustomText(
                                            color: Root.primary,
                                            data: RigesterClass.gender.text,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          RigesterClass.gender.text = "$value";
                                        });
                                      },
                                      items: [
                                        "63".tr,
                                        "64".tr,
                                      ]
                                          .map<DropdownMenuItem<String>>((String
                                                  value) =>
                                              DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Center(
                                                    child: CustomText(
                                                        color: Root.primary,
                                                        data: value,
                                                        textOverflow:
                                                            TextOverflow.clip,
                                                        size: Root.textsize),
                                                  )))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              )),
                          //  Goverment
                          FlipInY(
                              duration: Root.duration,
                              child: Container(
                                  width: Get.width * 0.8,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Root.primary,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Root.primary,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Material(
                                    elevation: 6,
                                    borderRadius: BorderRadius.circular(30),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        iconEnabledColor: Root.primary,
                                        iconDisabledColor: Root.primary,
                                        borderRadius: BorderRadius.circular(25),
                                        hint: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: CustomText(
                                            color: Root.primary,
                                            data: RigesterClass.cityID.text,
                                            size: Root.textsize,
                                            textOverflow: TextOverflow.clip,
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            RigesterClass.cityID.text = value!;
                                          });
                                        },
                                        items: RigesterClass.goverment
                                            .map<DropdownMenuItem<String>>(
                                                (value) => DropdownMenuItem<
                                                        String>(
                                                    onTap: () {
                                                      RigesterClass.cityid =
                                                          value.value;
                                                    },
                                                    value: value.label,
                                                    child: CustomText(
                                                        color: Root.primary,
                                                        data: value.label,
                                                        textOverflow:
                                                            TextOverflow.clip,
                                                        size: Root.textsize)))
                                            .toList(),
                                      ),
                                    ),
                                  ))),
                          // City
                          FlipInY(
                              duration: Root.duration,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: CustomTextField(
                                  onChanged: (s) {},
                                  controller: RigesterClass.city,
                                  textInputType: TextInputType.emailAddress,
                                  hints: '66'.tr,
                                  maxline: 1,
                                  maxlength: 100,
                                ),
                              )),
                          // Dscrp
                          FlipInY(
                              duration: Root.duration,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: CustomTextField(
                                  onChanged: (s) {},
                                  controller: RigesterClass.dscrp,
                                  textInputType: TextInputType.name,
                                  hints: '86'.tr,
                                  maxline: 3,
                                  maxlength: 350,
                                ),
                              )),
                          // Laweyrs Img
                          Container(
                            width: Get.width * .8,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomButton(
                                data: "70".tr,
                                ontap: () => RigesterClass.pickimg()),
                          ),
                          // Card Img
                          Container(
                            width: Get.width * .8,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomButton(
                                data: "69".tr,
                                ontap: () => RigesterClass.pickimgcardlaw()),
                          ),
                          // Rigester
                          Container(
                            width: Get.width * .8,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: CustomButton(
                                data: "56".tr,
                                ontap: () => RigesterClass.rigester()),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: Customloading());
                }),
          ),
        ),
      ),
    );
  }
}
