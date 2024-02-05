import 'package:books/Design/category.dart';
import 'package:books/Design/homecard.dart';
import 'package:books/constant/data.dart';
import 'package:books/constant/home.dart';
import 'package:books/constant/root.dart';
import 'package:books/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: CustomText(
                        color: Theme.of(context).focusColor,
                        size: Root.fontsize + 20,
                        data: "AppName".tr),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(Root.logo), fit: BoxFit.fill)),
                  )
                ],
              ),
            ),
          ),
          BookMarkCard(bookmarks: DataClass.favourite),
          Category(category: HomeClass.categoryList)
        ],
      ),
    );
  }
}
