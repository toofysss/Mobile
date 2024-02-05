import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/login.dart';
import 'package:law/Page/login/rigester.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/services/services.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Img Login
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
                              image: AssetImage(Root.logo), fit: BoxFit.fill)),
                    )),
                  ),
                ),
                // Login
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomText(
                      data: "57".tr,
                      size: Root.headersize,
                      color: Root.primary,
                      textOverflow: TextOverflow.clip,
                    ),
                  ),
                ),
                // UserName
                FlipInY(
                    duration: Root.duration,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomTextField(
                        controller: LoginClass.username,
                        textInputType: TextInputType.name,
                        maxline: 1,
                        maxlength: 11,
                        hints: '54'.tr,
                        onChanged: (s) {},
                      ),
                    )),
                // Password
                FlipInY(
                    duration: Root.duration,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: CustomTextField(
                        onChanged: (s) {},
                        controller: LoginClass.pass,
                        maxline: 1,
                        maxlength: 11,
                        hints: '55'.tr,
                        textInputType: TextInputType.name,
                      ),
                    )),
                // LoginButton
                Center(
                  child: Container(
                    width: Get.width * .8,
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: CustomButton(
                      data: "57".tr,
                      ontap: () async {
                        var response = await http.get(
                          Uri.parse(
                              "${ApiClass.api}/UserControll/CheckLogin?email=${LoginClass.username.text}&pass=${LoginClass.pass.text}"),
                          headers: const {"accept": "*/*"},
                        );
                        if (response.statusCode == 200) {
                          var responsebody = jsonDecode(response.body);
                          MyServices myServices = Get.find();
                          Data.laweysID.text = "${responsebody['lawersID']}";
                          myServices.sharedPreferences.setString(
                              "lawersID", "${responsebody['lawersID']}");
                          Get.back();
                          Get.forceAppUpdate();
                          Get.appUpdate();
                          LoginClass.clear();
                        } else {
                          return AlertClass.warning("59".tr);
                        }
                        Get.forceAppUpdate();
                        Get.appUpdate();
                      },
                    ),
                  ),
                ),

                Center(
                  child: Wrap(
                    children: [
                      // Dont Have Account
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CustomText(
                            color: Root.primary,
                            data: "58".tr,
                            size: Root.headersize,
                            textOverflow: TextOverflow.clip),
                      ),
                      // Rigester
                      GestureDetector(
                        onTap: () => Get.to(() => const Rigester(),
                            transition: Transition.fadeIn),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CustomText(
                              color: Root.primary,
                              data: "56".tr,
                              size: Root.headersize,
                              textOverflow: TextOverflow.clip),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
