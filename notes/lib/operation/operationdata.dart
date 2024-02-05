import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/constant/opeartion.dart';
import 'package:notes/widget/custombutton.dart';
import 'package:notes/widget/customtext.dart';
import 'package:notes/widget/customtextfield.dart';

class OperationData extends StatelessWidget {
  final String title;
  final String id;
  final String ids;
  final bool edit;
  const OperationData(
      {required this.title,
      required this.id,
      required this.ids,
      required this.edit,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageFiltered(
          imageFilter:
              ImageFilter.blur(sigmaX: Root.sigmax, sigmaY: Root.sigmay),
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
              data: title,
              size: Root.headersize,
              color: Root.bg,
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
          body: Center(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextField(
                      controller: OperationClass.title,
                      suffex: const SizedBox(),
                      lines: 1,
                      hint: "العنوان",
                    ),
                    CustomTextField(
                      controller: OperationClass.subtitle,
                      suffex: const SizedBox(),
                      lines: 1,
                      hint: "عنوان فرعي",
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: CustomTextField(
                        controller: OperationClass.subject,
                        suffex: const SizedBox(),
                        lines: 15,
                        hint: "",
                      ),
                    ),
                    CustomButton(
                        data: 'حفظ',
                        onTap: () => OperationClass.opeartion(edit, id, ids))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
