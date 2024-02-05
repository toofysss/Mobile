import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lawdashboard/main.dart';
import 'package:lawdashboard/widget/customtext.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:quickalert/quickalert.dart';

class AlertClass {
  static warning(String data) {
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
                  color: Root.headercolor,
                  data: data,
                  size: Root.textsize,
                  textOverflow: TextOverflow.clip,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static success() {
    return QuickAlert.show(
      context: Get.context!,
      borderRadius: 20,
      type: QuickAlertType.success,
      title: "تمت العملية بنجاح",
      // onConfirmBtnTap: () =>
      //     Get.offAll(() => const Homescreen(), transition: Transition.fadeIn),
      confirmBtnText: "حسنا",
      confirmBtnColor: const Color.fromARGB(255, 0, 109, 103),
    );
  }

  static sendmsg(String message) {
    return QuickAlert.show(
      context: Get.context!,
      borderRadius: 20,
      type: QuickAlertType.success,
      text: "تمت العملية بنجاح",
      confirmBtnText: "ارسال الرمز",
      onConfirmBtnTap: () async {
        await launchUrl(Uri.parse(
            "https://wa.me/${RigesterClass.phone.text}/?text=${Uri.encodeComponent(message)}"));
        RigesterClass.clear();
        Get.offAll(() => const Homescreen(), transition: Transition.fadeIn);
      },
      confirmBtnColor: const Color.fromARGB(255, 0, 109, 103),
    );
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
                color: Root.bottombg,
              )),
            ),
          ),
        );
      },
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
                  color: Root.headercolor,
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
}
