import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suraproject/Root/root.dart';
import 'package:suraproject/Widget/customtext.dart';

class CustomButton extends StatelessWidget {
  final String data;
  final Function()? ontap;
  const CustomButton({required this.data, required this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: Get.width * .5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Root.primary,
            boxShadow: [
              BoxShadow(
                  color: Root.secondry2,
                  offset: const Offset(2, 1),
                  blurRadius: 2,
                  spreadRadius: 2)
            ]),
        child: Center(
          child: CustomText(
              color: Root.secondry,
              data: data,
              size: Root.headersize,
              overflow: TextOverflow.clip),
        ),
      ),
    );
  }
}
