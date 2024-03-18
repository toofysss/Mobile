import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:law/Data/goverment.dart';
import 'package:law/Desing/customservices.dart';
import 'package:law/Page/Section/layers.dart';
import 'package:law/contant/root.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 60,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      scrollDirection: Axis.vertical,
      itemCount: GovermentClass.govermentlist.length,
      itemBuilder: (context, index) {
        var item = GovermentClass.govermentlist[index];
        return CustomServices(
          data: Root.lang == "en" ? "${item.cityE}" : "${item.cityA}",
          ontap: () => Get.to(
              () => Layers(
                    id: item.id!,
                    data: Root.lang == "en" ? "${item.cityE}" : "${item.cityA}",
                  ),
              transition: Transition.fadeIn),
        );
      },
    );
  }
}
