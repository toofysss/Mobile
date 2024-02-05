import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/widget/customtext.dart';

class HomeDitals extends StatelessWidget {
  final String data;
  final String title;
  const HomeDitals({required this.title, required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: Root.sigmax, sigmaY: Root.sigmay),
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Root.bgimage), fit: BoxFit.fill)),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: CusomtText(
                color: Root.bg,
                size: Root.headersize - 4,
                data: title,
              ),
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: Root.iconsize,
                    color: Root.bg,
                  ),
                ),
              ),
            ),
            body: Container(
              width: Get.width * .95,
              height: Get.height,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: Root.gradient),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:
                    CusomtText(color: Root.bg, data: data, size: Root.textsize),
              ),
            )),
      ],
    );
  }
}
