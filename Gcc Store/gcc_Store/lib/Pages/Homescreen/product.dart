import 'package:flutter/material.dart';
import 'package:gcc/Pages/product/bestseller.dart';
import 'package:gcc/Pages/product/blog.dart';
import 'package:gcc/Pages/product/lastproduct.dart';
import 'package:gcc/Pages/product/listsection.dart';
import 'package:gcc/Pages/product/product.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/constant/product.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: ColorsClass.appbarbg,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          maxLines: 1,
          data: "1".tr,
          size: All.header,
          colors: ColorsClass.textcolorsSecondry,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Directionality(
        textDirection: LanguageClass.lang.text == "English"
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const GetBlog(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CustomText(
                      maxLines: 1,
                      data: "50".tr,
                      size: All.header,
                      colors: ColorsClass.textcolor,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => ProductClass.viewsection(),
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CustomText(
                              maxLines: 1,
                              data: "51".tr,
                              size: All.header - 5,
                              colors: ColorsClass.textcolor,
                              fontWeight: FontWeight.bold),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: All.iconSize - 10,
                            color: ColorsClass.iconcolor,
                          ),
                        ],
                      )),
                )
              ],
            ),
            const ListSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CustomText(
                      maxLines: 1,
                      data: "52".tr,
                      size: All.header,
                      colors: ColorsClass.textcolor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const LastProduct(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CustomText(
                      maxLines: 1,
                      data: "53".tr,
                      size: All.header,
                      colors: ColorsClass.textcolor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const BestSeller(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: CustomText(
                      maxLines: 1,
                      data: "2".tr,
                      size: All.header,
                      colors: ColorsClass.textcolor,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => ProductClass.viewproduct(),
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CustomText(
                              maxLines: 1,
                              data: "51".tr,
                              size: All.header - 5,
                              colors: ColorsClass.textcolor,
                              fontWeight: FontWeight.bold),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: All.iconSize - 10,
                            color: ColorsClass.iconcolor,
                          ),
                        ],
                      )),
                )
              ],
            ),
            const GetProduct()
          ]),
        ),
      ),
    );
  }
}
