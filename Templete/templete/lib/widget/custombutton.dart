import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/widget/customtext.dart';

class CustomButton extends StatelessWidget {
  final String data;
  final Function()? ontap;
  const CustomButton({required this.data, 
  required this.ontap,
  super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: Get.width * .7,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1.5, color: Root.textcolor)),
        child: Center(
            child: CusomtText(
                color: Root.textcolor, data: data, size: Root.textsize)),
      ),
    );
  }
}
