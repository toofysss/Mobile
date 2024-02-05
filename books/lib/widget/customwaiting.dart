import 'package:books/constant/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomWaiting extends StatelessWidget {
  const CustomWaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: Get.width * .4,
        ),
        child: Lottie.asset(Root.search, fit: BoxFit.fill));
  }
}
