import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Data/services.dart';
import 'package:law/Desing/customservices.dart';
import 'package:law/contant/root.dart';
import 'package:law/widget/backbutton.dart';
import 'package:law/widget/customtext.dart';

class IraqPortalController extends GetxController {
  List<ServicesClass> iraqPortal = [
    ServicesClass(
        ontap: () => Data.urllauncher("https://e-court.sjc.iq/qassam"),
        title: "26".tr),
    ServicesClass(
        ontap: () =>
            Data.urllauncher("https://e-court.sjc.iq/marriage-contract"),
        title: "27".tr),
    ServicesClass(
        ontap: () => Data.urllauncher("https://e-court.sjc.iq/arguments"),
        title: "28".tr),
  ];
}

// بوابة القضاء
class IraqPortal extends StatelessWidget {
  const IraqPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IraqPortalController>(
        init: IraqPortalController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: CustomText(
                      color: Theme.of(context).appBarTheme.foregroundColor!,
                      data: "14".tr,
                      size: Root.textsize,
                      textOverflow: TextOverflow.clip),
                  leading: const BackPageButton()),
              body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 100,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.iraqPortal.length,
                      itemBuilder: (context, index) {
                        var item = controller.iraqPortal[index];
                        return CustomServices(
                            data: item.title, ontap: item.ontap);
                      })));
        });
  }
}
