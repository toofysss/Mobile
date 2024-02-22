import 'package:books/constant/root.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hints;
  final IconData iconData;
  final Function(String value)? onTap;
  const CustomTextField(
      {required this.controller,
      required this.hints,
      required this.onTap,
      required this.iconData,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * .85,
        child: Material(
          elevation: 10,
          shadowColor: Theme.of(context).shadowColor,
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          child: TextField(
              //  التحكم
              controller: controller,

              style: TextStyle(
                  fontSize: Root.fontsize + 5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textInputAction: TextInputAction.done,
              onChanged: onTap,
              cursorColor: ThemeDataClass.grey,
              decoration: InputDecoration(
                hintText: hints,
                hintStyle: TextStyle(color: ThemeDataClass.grey),
                prefixIcon: Icon(
                  iconData,
                  color: Colors.black,
                  size: Root.iconsize + 5,
                ),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          
        ),
      ),
    );
  }
}
