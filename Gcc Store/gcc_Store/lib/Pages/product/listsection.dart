import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/product.dart';
import 'package:gcc/constant/section.dart';
import 'package:gcc/widget/customloading.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/errorMessage.dart';
import 'package:get/get.dart';

class ListSection extends StatelessWidget {
  const ListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProductClass.getsection(context),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return ErrorMessage(
            subtitle: "25".tr,
            title: "24".tr,
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data.length == 0) {
            return SizedBox(
                width: Get.width, height: 130, child: const CustomLoading());
          }
        }

        // جلب البيانات
        if (snapshot.hasData) {
          return SizedBox(
            height: 210,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final item = snapshot.data[index];
                return FlipInY(
                  duration: SectionClass.duration,
                  child: Container(
                    width: 100,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsClass.bordercolor,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Container(
                              height: 125,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(item['image']),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ), // Text
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: CustomText(
                            maxLines: 1,
                            data: "${item['title']}",
                            fontWeight: FontWeight.bold,
                            colors: Colors.black,
                            size: All.textsize,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          //  واجهة الانتظار
          return SizedBox(
              width: Get.width, height: 130, child: const CustomLoading());
        }

        //  واجهة الانتظار
        return SizedBox(
            width: Get.width, height: 130, child: const CustomLoading());
      },
    );
  }
}
