import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';

class CustomTextField extends StatelessWidget {
  final Function()? ontap;
  final TextEditingController controller;
  final String hint;
  const CustomTextField(
      {required this.ontap,
      required this.hint,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      width: Get.width * .9,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        showCursor: false,
        controller: controller,
        style: TextStyle(
          fontSize: Root.textsize,
          color: Root.bgprimary,
          fontWeight: FontWeight.w700,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
        ),
      ),
    );
  }
}
