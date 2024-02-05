import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/services.dart';
import 'package:law/Desing/customcard.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customtext.dart';

// بوابة القضاء
class IraqPortal extends StatelessWidget {
  const IraqPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Root.backgroundApp,
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: CustomText(
                  color: Root.primary,
                  data: "14".tr,
                  size: Root.headersize,
                  textOverflow: TextOverflow.clip),
              leading: const BackPageButton()),
          body: Directionality(
              textDirection: LanguageClass.lang.text == "English"
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: IraqPortalClass.iraqPortal.length,
                      itemBuilder: (context, index) {
                        var item = IraqPortalClass.iraqPortal[index];
                        return GestureDetector(
                            onTap: item.ontap,
                            child: CustomCardLaw(
                              widget: Center(
                                child: CustomText(
                                    color: Colors.white,
                                    data: item.title,
                                    size: Root.textsize,
                                    textOverflow: TextOverflow.clip),
                              ),
                            ));
                      }))),
        ));
  }
}
