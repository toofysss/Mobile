import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/widget/customtext.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String data;
  const CustomButton({required this.data, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        width: Get.width * .6,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Root.bg,
            gradient: Root.gradient),
        child: Center(
          child: CusomtText(
            color: Root.bg,
            data: data,
            size: Root.textsize,
          ),
        ),
      ),
    );
  }
}
