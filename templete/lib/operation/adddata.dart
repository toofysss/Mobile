import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/widget/custombutton.dart';
import 'package:templete/widget/customtext.dart';
import 'package:templete/widget/customtextfield.dart';

class AddData extends StatefulWidget {
  final bool edit;
  final String hint;
  const AddData({required this.edit, required this.hint, super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
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
            data: widget.hint,
            size: Root.textsize,
            color: Root.textcolor,
          ),
        ),
        body: Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.rtl
              : TextDirection.rtl,
          child: SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CusomtText(
                        color: Root.textcolor,
                        data: "17".tr,
                        size: Root.textsize),
                  ),
                  Center(
                    child: Container(
                      width: Get.width * 0.9,
                      margin: const EdgeInsets.symmetric(vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Root.bg,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Material(
                        elevation: 6,
                        shadowColor: Root.primary,
                        borderRadius: BorderRadius.circular(30),
                        child: ListTile(
                          title: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              iconEnabledColor: Root.primary,
                              iconDisabledColor: Root.primary,
                              borderRadius: BorderRadius.circular(25),
                              hint: CusomtText(
                                color: Root.primary,
                                data: OperationClass.sections.text,
                                size: Root.textsize,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  OperationClass.sections.text = value!;
                                });
                              },
                              items: SectionClass.sectionList
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  onTap: () {
                                    OperationClass.sectionID = value.id;
                                  },
                                  value: value.section,
                                  child: CusomtText(
                                    color: Root.bg,
                                    data: value.section,
                                    size: Root.textsize,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CusomtText(
                        color: Root.textcolor,
                        data: "16".tr,
                        size: Root.textsize),
                  ),
                  Center(
                    child: CustomTextField(
                        ontap: () {},
                        hint: "",
                        controller: OperationClass.dscrp),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: CusomtText(
                        color: Root.textcolor,
                        data: "15".tr,
                        size: Root.textsize),
                  ),
                  Center(
                    child: CustomTextField(
                        ontap: () {},
                        hint: "",
                        controller: OperationClass.videolink),
                  ),
                  Center(
                    child: CustomButton(
                        data: "14".tr,
                        ontap: () => OperationClass.dataoperation(widget.edit)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
