import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/widget/custombutton.dart';
import 'package:templete/widget/customtext.dart';
import 'package:templete/widget/customtextfield.dart';

class AddSection extends StatelessWidget {
  final bool edit;
  final String hint;
  const AddSection({
    required this.hint,
    required this.edit, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Root.bg,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: CusomtText(
            data:hint ,
            size: Root.textsize,
            color: Root.textcolor,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CustomTextField(
                    ontap: () {}, hint: "", controller: OperationClass.section),
                CustomButton(
                    data: "14".tr, ontap:()=> OperationClass.sectionoperation(edit))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
