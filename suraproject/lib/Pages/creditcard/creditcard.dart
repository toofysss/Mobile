import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:suraproject/Root/root.dart';
import 'package:suraproject/Widget/custombutton.dart';
import 'package:suraproject/Widget/customtextfield.dart';
import 'package:suraproject/Widget/customtextfiled.dart';
import 'package:path_provider/path_provider.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Root.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Root.primary,
        leading: GestureDetector(
            onTap: () {
              clean();
              FocusScope.of(context).unfocus();
              Get.back();
            },
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Root.primary,
                  boxShadow: [
                    BoxShadow(
                        color: Root.secondry2,
                        offset: const Offset(2, 1),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ]),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 25,
                color: Root.secondry,
              ),
            )),
        actions: [
          GestureDetector(
              onTap: () => clean(),
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Root.primary,
                    boxShadow: [
                      BoxShadow(
                          color: Root.secondry2,
                          offset: const Offset(2, 1),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                child: Icon(
                  Icons.refresh,
                  size: 25,
                  color: Root.secondry,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              CustomTextFieldName(
                controller: CreditCardClass.name,
                hint: "الاسم",
                textInputType: TextInputType.name,
                focusNode: CreditCardClass.namefocus,
              ),
              CustomTextField(
                controller: CreditCardClass.birthday,
                hint: "التاريخ",
                textInputType: TextInputType.name,
              ),
              CustomTextField(
                controller: CreditCardClass.no,
                hint: "الرمز التعريفي",
                textInputType: TextInputType.name,
              ),
              CustomTextField(
                controller: CreditCardClass.namesize,
                hint: "حجم الاسم",
                textInputType: TextInputType.number,
              ),
              CustomTextField(
                controller: CreditCardClass.birthdaysize,
                hint: "حجم التاريخ",
                textInputType: TextInputType.number,
              ),
              CustomTextField(
                controller: CreditCardClass.nosize,
                hint: "حجم الرقم التعريفي",
                textInputType: TextInputType.number,
              ),
              CustomTextField(
                controller: CreditCardClass.spaceword,
                hint: "مسافة بين الاحرف في الاسم",
                textInputType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: CustomButton(
                    data: "عرض البطاقة",
                    ontap: () {
                      Get.to(() => const ViewCard(),
                          transition: Transition.fadeIn);
                      FocusScope.of(context).unfocus();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ViewCard extends StatefulWidget {
  const ViewCard({super.key});

  @override
  State<ViewCard> createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard> {
  Future<Uint8List> convertImageToPdf(Uint8List imageBytes) async {
    final pdf = pw.Document();
    final image = pw.MemoryImage(imageBytes);
    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Center(child: pw.Image(image));
    }));

    return pdf.save();
  }

  captureWidget() async {
    final imageBytes = await CreditCardClass.screenshotController.capture();
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/${CreditCardClass.name.text}.pdf');
    final pdfBytes = await convertImageToPdf(imageBytes!);
    await tempFile.writeAsBytes(pdfBytes);
    String mimeType = 'application/pdf';
    Share.shareFiles([tempFile.path],
        text: CreditCardClass.name.text, mimeTypes: [mimeType]);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.primary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Root.primary,
          leading: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                Get.back();
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Root.primary,
                    boxShadow: [
                      BoxShadow(
                          color: Root.secondry2,
                          offset: const Offset(2, 1),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 25,
                  color: Root.secondry,
                ),
              )),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Screenshot(
                      controller: CreditCardClass.screenshotController,
                      child: Stack(
                        children: [
                          Container(
                            width: 356.0,
                            height: 204.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Root.cardimage),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 15,
                            child: Text(
                              CreditCardClass.name.text.toUpperCase(),
                              style: TextStyle(
                                fontSize:
                                    double.parse(CreditCardClass.namesize.text),
                                color: Root.secondry,
                                fontWeight: FontWeight.w400,
                                letterSpacing: double.parse(
                                    CreditCardClass.spaceword.text),
                                fontFamily: "WhiteVinegar",
                              ),
                            ),
                          ),
                          Positioned(
                            top: 36,
                            left: 15,
                            child: Text(
                              CreditCardClass.birthday.text.toUpperCase(),
                              style: TextStyle(
                     
                                fontSize: double.parse(
                                    CreditCardClass.birthdaysize.text),
                                color: Root.secondry,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 2,
                                fontFamily: "OCR",
                              ),
                            ),
                          ),
                          Positioned(
                            top: 54,
                            left: 15,
                            child: Text(
                              CreditCardClass.no.text.toUpperCase(),
                              style: TextStyle(
                                fontSize:
                                    double.parse(CreditCardClass.nosize.text),
                                color: Root.secondry,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                fontFamily: "OCR",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: CustomButton(
                      data: "مشاركة الصورة",
                      ontap: () async {
                        captureWidget();
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
