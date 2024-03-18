import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/contant/root.dart';

class BackPageButton extends StatelessWidget {
  const BackPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).indicatorColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          size: Root.iconsSize + 5,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
