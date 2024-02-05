import 'package:flutter/material.dart';
import 'package:law/contant/root.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class CustomFloatingSearch extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Function(String)? onchnage;

  const CustomFloatingSearch({
    super.key,
    required this.controller,
    required this.hint,
    required this.onchnage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SearchBarAnimation(
        enableKeyboardFocus: true,
        isOriginalAnimation: true,
        searchBoxBorderColour: Root.primary,
        enableButtonShadow: false,
        buttonElevation: 0,
        enableBoxShadow: true,
        enableBoxBorder: true,
        enableButtonBorder: true,
        buttonBorderColour: Root.primary,
        durationInMilliSeconds: 100,
        hintText: hint,
        textAlignToRight: true,
        isSearchBoxOnRightSide: true,
        buttonShadowColour: Root.primary,
        onChanged: onchnage,
        buttonColour: Root.primary,
        textEditingController: controller,
        trailingWidget: GestureDetector(
          onTap: () {
            if (controller.text.isNotEmpty) {
              controller.text =
                  controller.text.substring(0, controller.text.length - 1);
              onchnage?.call(controller.text);
            }
          },
          child: Icon(
            Icons.close,
            color: Root.primary,
            size: 28,
          ),
        ),
        secondaryButtonWidget: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Root.secondry,
            size: 28,
          ),
        ),
        buttonWidget: Center(
          child: Icon(
            Icons.search,
            color: Root.secondry,
            size: 28,
          ),
        ),
      ),
    );
  }
}
