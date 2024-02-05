import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete/Pages/viewsection.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/widget/customloading.dart';
import 'package:templete/widget/customtext.dart';

class Section extends StatelessWidget {
  const Section({super.key});

  @override
  Widget build(BuildContext context) {
    if (Data.json.isNotEmpty) {
      return GridView.builder(
          itemCount: Data.json.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 100,
              crossAxisSpacing: 10,
              mainAxisSpacing: 25),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(() => ViewSection(
                    image: Data.json[index]['notes'],
                    title: "${Data.json[index]['section']}",
                  )),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: .5, color: Root.textcolor)),
                child: Center(
                    child: CusomtText(
                        color: Root.textcolor,
                        data: "${Data.json[index]['section']}",
                        size: Root.textsize)),
              ),
            );
          });
    }
    return const CustomLoading();
  }
}
