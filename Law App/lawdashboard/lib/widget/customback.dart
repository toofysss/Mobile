import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
import 'package:lawdashboard/constant/root.dart';

class CustomBackButtton extends StatelessWidget {
  const CustomBackButtton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Data.clear();
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          color: Root.headercolor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            size: Root.headersize,
          ),
        ),
      ),
    );
  }
}
