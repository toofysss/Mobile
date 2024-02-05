import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/constant/root.dart';

// تصميم النص
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxlength;
  final String hints;
  final int maxline;
  final TextInputType textInputType;
  const CustomTextField(
      {required this.textInputType,
      required this.controller,
      required this.maxline,
      required this.maxlength,
      required this.hints,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .8,
      child: Material(
        elevation: 6,
        shadowColor: Root.backgroundApp,
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          maxLines: maxline,
          //  التحكم
          controller: controller,
          style: TextStyle(
              fontSize: Root.textsize - 3,
              color: Root.textcolor,
              fontWeight: FontWeight.bold),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          cursorColor: Root.headercolor,
          decoration: InputDecoration(
            labelText: hints,
            labelStyle: TextStyle(
                fontSize: Root.textsize - 3,
                color: Root.textcolor,
                fontWeight: FontWeight.bold),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
        ),
      ),
    );
  }
}
