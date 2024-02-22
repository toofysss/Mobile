import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/contant/api.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/alert.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/custombutton.dart';
import 'package:law/widget/customtext.dart';
import 'package:law/widget/customtextfield.dart';
import 'package:http/http.dart' as http;
// استشارة قانونية

class ConsultationController extends GetxController {
  TextEditingController type = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController dscrp = TextEditingController();
  File? files;

  pickfile() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result == null) return;
    PlatformFile filepicker = result.files.first;
    files = File(filepicker.path!);
    Get.forceAppUpdate();
    AlertClass.upload();
  }

  sendfile(String userID) async {
    if (Data.online != true) {
      return AlertClass.error("50".tr);
    }
    if (files == null) {
      return AlertClass.warning("49".tr);
    }

    AlertClass.waiting();
    var url = Uri.parse('${ApiClass.api}/Consultation/Insert');
    var request = http.MultipartRequest("POST", url);
    request.fields["UserID"] = userID;
    request.fields["Phone"] = whatsapp.text;
    request.fields["Status"] = "0";
    request.fields["Dscrp"] = dscrp.text;
    request.fields["Address"] = address.text;
    request.fields["Files"] = "";
    request.fields["Type"] = type.text;
    request.fields["ID"] = "0";

    // Add the image file
    var file = await http.MultipartFile.fromPath(
      "file",
      files!.path,
    );
    request.files.add(file);

    var response = await request.send();
    if (response.statusCode == 200) {
      Get.back();
      return AlertClass.success("48".tr);
    }
  }
}

class Consultation extends StatelessWidget {
  final String userID;
  const Consultation({required this.userID, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConsultationController>(
        init: ConsultationController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
                centerTitle: true,
                title: CustomText(
                    color: Theme.of(context).appBarTheme.foregroundColor!,
                    data: "11".tr,
                    size: Root.textsize,
                    textOverflow: TextOverflow.ellipsis),
                leading: const BackPageButton()),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * .9,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextField(
                          textInputType: TextInputType.streetAddress,
                          controller: controller.address,
                          hints: "39".tr,
                          maxline: 1,
                        ),
                      ),
                      Container(
                        width: Get.width * .9,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextField(
                          textInputType: TextInputType.number,
                          controller: controller.whatsapp,
                          hints: "42".tr,
                          maxline: 1,
                        ),
                      ),
                      Container(
                        width: Get.width * .9,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextField(
                          textInputType: TextInputType.name,
                          controller: controller.type,
                          hints: "38".tr,
                          maxline: 1,
                        ),
                      ),
                      Container(
                        width: Get.width * .9,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextField(
                          textInputType: TextInputType.multiline,
                          controller: controller.dscrp,
                          hints: "40".tr,
                          maxline: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // المرفقات
                            SizedBox(
                                width: Get.width * .4,
                                child: CustomButton(
                                    data: "41".tr,
                                    ontap: () => controller.pickfile())),
                            //  Send Btn
                            SizedBox(
                                width: Get.width * .4,
                                child: CustomButton(
                                    data: "43".tr,
                                    ontap: () => controller.sendfile(userID)))
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          );
        });
  }
}
