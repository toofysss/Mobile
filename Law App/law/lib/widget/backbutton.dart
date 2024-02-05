import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/contact.dart';
import 'package:law/Data/login.dart';
import 'package:law/Data/services.dart';
import 'package:law/contant/root.dart';

class BackPageButton extends StatelessWidget {
  const BackPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: () {
          Get.back();
          ContactClass.clean();
          LoginClass.clear();
          RigesterClass.clear();
          NewsClass.clear();
          AnnouncingMoreRealEstateClass.clear();
          ConsultationClass.clear();
          AppointmentLawyerClass.clear();
          CasesClass.clear();
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Root.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: Root.iconsSize + 5,
            color: Root.secondry,
          ),
        ),
      ),
    );
  }
}
