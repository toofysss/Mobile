import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constant/constant.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget suffex;
  final int lines;
  final String hint;
  const CustomTextField(
      {required this.controller,
      required this.suffex,
      required this.lines,
      required this.hint,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: Get.width * .9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: TextField(
          maxLines: lines,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          showCursor: true,
          cursorColor: Colors.black,
          controller: controller,
          style: TextStyle(
              fontSize: Root.textsize,
              color: Colors.black,
              fontWeight: FontWeight.w700),
          decoration: InputDecoration(
              suffix: suffex,
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
              labelText: hint,
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: Root.textsize,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
