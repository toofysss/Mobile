import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/constant/opeartion.dart';
import 'package:notes/widget/custombutton.dart';
import 'package:notes/widget/customtext.dart';
import 'package:path/path.dart' as path;

class OperationTitle extends StatefulWidget {
  const OperationTitle({super.key});

  @override
  State<OperationTitle> createState() => _OperationTitleState();
}

class _OperationTitleState extends State<OperationTitle> {
  uploadimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      OperationClass.imagetitle = File(image.path);
      OperationClass.name = path.basename(image.path);
    });
  }

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
        Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: CusomtText(
                  color: Root.bg, data: "صورة جديدة", size: Root.headersize),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OperationClass.imagetitle == null
                        ? GestureDetector(
                            onTap: () => uploadimage(),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              width: Get.width * .75,
                              height: Get.width * .75,
                              decoration: BoxDecoration(
                                gradient: Root.gradient,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.image_rounded,
                                size: 100,
                                color: Root.bg,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () => uploadimage(),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              width: Get.width * .75,
                              height: Get.width * .75,
                              decoration: BoxDecoration(
                                  gradient: Root.gradient,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image:
                                          FileImage(OperationClass.imagetitle!),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                    CustomButton(
                      onTap: () => OperationClass.uploadimage(),
                      data: 'حفظ',
                    )
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
