import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suraproject/Root/root.dart';

// تصميم النص
class CustomTextFieldName extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType textInputType;
  final FocusNode focusNode;
  const CustomTextFieldName(
      {required this.textInputType,
      required this.controller,
      required this.hint,
      required this.focusNode,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        width: Get.width * .9,
        child: Material(
          elevation: 5,
          shadowColor: Root.secondry2,
          borderRadius: BorderRadius.circular(25),
          child: TextField(
            focusNode: focusNode,
            //  التحكم
            controller: controller,
            style: TextStyle(
                fontSize: Root.headersize - 3,
                color: Root.primary,
                fontWeight: FontWeight.bold),
            keyboardType: textInputType,
            textInputAction: TextInputAction.newline,
            cursorColor: Root.primary,
            decoration: InputDecoration(
              labelText: hint,
              labelStyle: TextStyle(
                  fontSize: Root.headersize - 3,
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
