import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constant/constant.dart';
import 'package:notes/widget/custombutton.dart';
import 'package:notes/widget/customtext.dart';

class OperationClass {
  static TextEditingController title = TextEditingController();
  static TextEditingController subtitle = TextEditingController();
  static TextEditingController subject = TextEditingController();
  static File? imagetitle;
  static String? name;

  static clear() {
    title.clear();
    subject.clear();
    subtitle.clear();
    imagetitle == null;
    name = "";
    Get.forceAppUpdate();
    Get.appUpdate();
  }

  static uploadimage() async {
    var storag = FirebaseStorage.instance.ref(name);
    await storag.putFile(imagetitle!);
    var link = await storag.getDownloadURL();
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Data");
    collectionReference.add({"images": link});
    Get.back();
    clear();
  }

  static opeartion(bool edit, String id, String ids) async {
    if (edit) {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection("Data")
          .doc(id)
          .collection("Data");
      collectionReference.doc(ids).update({
        "title": title.text,
        "subtitle": subtitle.text,
        "subject": subject.text
      });
      Get.back();
      clear();
    } else {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection("Data")
          .doc(ids)
          .collection("Data");
      collectionReference.add({
        "title": title.text,
        "subtitle": subtitle.text,
        "subject": subject.text
      });
      Get.back();
      clear();
    }
  }

  static deleteopeartion(bool edit, String id, String ids) async {
    if (edit) {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection("Data")
          .doc(id)
          .collection("Data");

      collectionReference.doc(ids).delete();
      Get.back();
      clear();
    } else {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection("Data");
      collectionReference.doc(id).delete();
      Get.back();
      clear();
    }
  }

  static showedit(String title, Widget content) {
    showGeneralDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierLabel: "",
      pageBuilder: (context, animation, secondaryAnimation) => Container(),
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
            scale: Tween<double>(begin: .5, end: 1).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: .5, end: 1).animate(a1),
              child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.white.withOpacity(.25),
                  title: content),
            ));
      },
    );
  }

  static showNotification(Function()? ontap) {
    showedit(
        "",
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CusomtText(
                  color: Root.bg,
                  data: "سوف يتم حذف\n هل انت متأكد",
                  size: Root.textsize + 5),
            ),
            CustomButton(data: 'حسنا', onTap: ontap)
          ],
        ));
  }
}
