import 'package:flutter/material.dart';
import 'package:gcc/Pages/forgetPassword/changepassword.dart';
import 'package:gcc/Pages/forgetPassword/confirmemail.dart';
import 'package:gcc/Pages/login/login.dart';
import 'package:get/get.dart';

class ForgetPasswordClass {
  static TextEditingController reset = TextEditingController();
  static TextEditingController selectreset = TextEditingController();
  static TextEditingController confirmpass = TextEditingController();
  static TextEditingController password = TextEditingController();

  static Future checkdata(BuildContext context) async {
    Get.to(() => const ConfirmEmail(), transition: Transition.fadeIn);
  }

  static Future changepass(BuildContext context) async {
    Get.offAll(() => const Login(), transition: Transition.fadeIn);
  }

  static Future checkpass(BuildContext context) async {
    Get.to(() => const ChangePassword(), transition: Transition.fadeIn);
  }
}
