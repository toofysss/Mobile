import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Page/setting/login/rigester.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/services/services.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  login() async {
    var response = await http.get(
      Uri.parse(
          "${ApiClass.api}/UserControll/CheckLogin?email=${username.text}&pass=${pass.text}"),
      headers: const {"accept": "*/*"},
    );
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      MyServices myServices = Get.find();
      Data.laweysID = "${responsebody['lawersID']}";
      myServices.sharedPreferences
          .setString("lawersID", "${responsebody['lawersID']}");
      Get.back();
      Get.forceAppUpdate();
    } else {
      return AlertClass.warning("59".tr);
    }
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const BackPageButton()),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                image: AssetImage(Root.logo),
                                fit: BoxFit.fill)),
                      )),
                    ),
                  ),
                  // Login
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: CustomText(
                        data: "57".tr,
                        size: Root.textsize,
                        color: Theme.of(context).appBarTheme.foregroundColor!,
                        textOverflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  // UserName
                  Container(
                    width: Get.width * .9,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: CustomTextField(
                      controller: controller.username,
                      textInputType: TextInputType.name,
                      maxline: 1,
                      hints: '54'.tr,
                    ),
                  ),
                  // Password
                  Container(
                    width: Get.width * .9,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: CustomTextField(
                      controller: controller.pass,
                      maxline: 1,
                      hints: '55'.tr,
                      textInputType: TextInputType.name,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Wrap(
                        children: [
                          // Dont Have Account
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomText(
                                color: Theme.of(context)
                                    .appBarTheme
                                    .foregroundColor!,
                                data: "58".tr,
                                size: Root.textsize,
                                textOverflow: TextOverflow.clip),
                          ),
                          // Rigester
                          GestureDetector(
                            onTap: () => Get.to(() => const Rigester(),
                                transition: Transition.fadeIn),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CustomText(
                                  color: Theme.of(context).focusColor,
                                  data: "56".tr,
                                  size: Root.textsize,
                                  textOverflow: TextOverflow.clip),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // LoginButton
                  Center(
                    child: Container(
                      width: Get.width * .8,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: CustomButton(
                          data: "57".tr, ontap: () => controller.login()),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
