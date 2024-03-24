import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonDesing extends StatelessWidget {
  final IconData iconData;
  final Function()? onTap;
  const ButtonDesing({required this.iconData, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).buttonTheme.colorScheme!.background),
        child: Icon(
          iconData,
          size: Get.width / 14,
        ),
      ),
    );
  }
}
