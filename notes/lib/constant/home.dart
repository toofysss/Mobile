import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/operation/operationdata.dart';

class HomeScreenClass {
  static TextEditingController searchdata = TextEditingController();

  static CollectionReference viewimage =
      FirebaseFirestore.instance.collection("Data");

  static operation(String title, String id, bool edit, String ids) async {
    Get.to(
        () => OperationData(
              title: title,
              edit: edit,
              id: id,
              ids: ids,
            ),
        transition: Transition.fade);
  }
}
