import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomtextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  const CustomtextField(
      {required this.hint, required this.textEditingController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .9,
      alignment: Alignment.center,
      child: TextField(
        controller: textEditingController,
        style: TextStyle(
          fontSize: Get.width / 18,
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: TextStyle(
              fontSize: Get.width / 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor.withOpacity(.7)),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
