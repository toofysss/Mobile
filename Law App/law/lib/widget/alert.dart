import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/customtext.dart';
import 'package:quickalert/quickalert.dart';

class AlertClass {
  static error(String data) {
    return QuickAlert.show(
      context: Get.context!,
      borderRadius: 20,
      type: QuickAlertType.warning,
      title: data,
      confirmBtnText: "182".tr,
      confirmBtnColor: Root.primary,
    );
  }

  static warning(String data) {
    return QuickAlert.show(
      context: Get.context!,
      borderRadius: 20,
      type: QuickAlertType.warning,
      title: data,
      confirmBtnText: "182".tr,
      confirmBtnColor: Root.primary,
    );
  }

  static success(String data) {
    return QuickAlert.show(
      context: Get.context!,
      borderRadius: 20,
      type: QuickAlertType.success,
      title: data,
      confirmBtnText: "182".tr,
      confirmBtnColor: Root.primary,
    );
  }

  static upload() {
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: .5, end: 1).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: .5, end: 1).animate(a1),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Root.backgroundApp,
              title: Center(
                child: CustomText(
                  color: Root.primary,
                  data: "87".tr,
                  size: Root.textsize,
                  textOverflow: TextOverflow.clip,
                ),
              ),
            ),
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 1), () => Get.back());
  }

  static waiting() {
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: .5, end: 1).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: .5, end: 1).animate(a1),
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Root.backgroundApp,
              title: Center(
                  child: CircularProgressIndicator(
                color: Root.primary,
              )),
            ),
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 1), () => Get.back());
  }
}
