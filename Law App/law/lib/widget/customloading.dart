import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/contant/root.dart';
import 'package:lottie/lottie.dart';

class Customloading extends StatelessWidget {
  const Customloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Root.loading,
      fit: BoxFit.contain,
      width: Get.width,
      height: Get.height,
    );
  }
}
