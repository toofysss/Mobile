import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/constant/root.dart';
import 'package:quran/localization/changelocal.dart';

class CustomBackButtom extends StatelessWidget {
  const CustomBackButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.back(),
      onTap: () => Root.lang == "en"
          ? LocalController().changeLang("ar")
          : LocalController().changeLang("en"),
      child: Icon(
        Icons.home_outlined,
        color: Theme.of(context).buttonTheme.colorScheme!.primary,
        size: Root.iconsize + 10,
      ),
    );
  }
}
