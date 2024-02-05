import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/contant/root.dart';

// تصميم النص
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxlength;
  final String hints;
  final int maxline;
  final Function(String)? onChanged;
  final TextInputType textInputType;
  const CustomTextField(
      {required this.textInputType,
      required this.onChanged,
      required this.controller,
      required this.maxline,
      required this.maxlength,
      required this.hints,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * .8,
        child: Material(
          elevation: 10,
          shadowColor: Root.backgroundApp,
          borderRadius: BorderRadius.circular(20),
          child: TextField(
            maxLines: maxline,
            onChanged: onChanged,
            //  التحكم
            controller: controller,
            style: TextStyle(
                fontSize: Root.textsize - 3,
                color: Root.primary,
                fontWeight: FontWeight.bold),
            keyboardType: textInputType,
            textInputAction: TextInputAction.newline,
            cursorColor: Root.primary,
            decoration: InputDecoration(
              labelText: hints,
              labelStyle: TextStyle(
                  fontSize: Root.textsize - 3,
                  color: Root.primary,
                  fontWeight: FontWeight.bold),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            ),
          ),
        ),
      ),
    );
  }
}
