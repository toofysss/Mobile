import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/contsant/root.dart';

// تصميم النص
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hints;
  final TextInputType textInputType;
  final IconData iconData;
  final bool readonly;
  final Function()? ontap;
  const CustomTextField(
      {required this.textInputType,
      required this.controller,
      required this.hints,
      required this.iconData,
      required this.readonly,
      required this.ontap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .8,
      child: Material(
        elevation: 6,
        shadowColor: Root.appbg,
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          readOnly: readonly,
          //  التحكم
          controller: controller,
          style: TextStyle(
              fontSize: Root.textsize,
              color: Colors.black,
              fontWeight: FontWeight.bold),
          keyboardType: textInputType,
          textInputAction: TextInputAction.next,
          cursorColor: Root.appbg,
          decoration: InputDecoration(
            labelText: hints,
            labelStyle: TextStyle(
                fontSize: Root.textsize,
                color: Root.appbg,
                fontWeight: FontWeight.bold),
            suffixIcon: GestureDetector(
              onTap: ontap,
              child: Icon(
                iconData,
                color: Root.appbg,
              ),
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),
        ),
      ),
    );
  }
}
