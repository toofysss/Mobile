import 'package:books/Design/category.dart';
import 'package:books/Design/homecard.dart';
import 'package:books/constant/data.dart';
import 'package:books/constant/home.dart';
import 'package:books/constant/root.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Book',
                            style: TextStyle(
                                color: Theme.of(context).indicatorColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Root.fontsize + 10),
                          ),
                          TextSpan(
                            text: 'Flow',
                            style: TextStyle(
                                color: Theme.of(context).focusColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Root.fontsize + 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                Root.mode == "on" ? Root.logodark : Root.logo),
                            fit: BoxFit.fill)),
                  )
                ],
              ),
            ),
          ),
          BookMarkCard(bookmarks: DataClass.favourite),
          Category(category: [
            CategoryClass(
                iconData: FontAwesomeIcons.headSideVirus, title: "s1".tr),
            CategoryClass(iconData: FontAwesomeIcons.bullseye, title: "s2".tr),
            CategoryClass(iconData: FontAwesomeIcons.landmark, title: "s3".tr),
            CategoryClass(iconData: FontAwesomeIcons.codeFork, title: "s4".tr),
            CategoryClass(iconData: FontAwesomeIcons.stairs, title: "s6".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.graduationCap, title: "s19".tr),
            CategoryClass(iconData: FontAwesomeIcons.comments, title: "s8".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.appleWhole, title: "s9".tr),
            CategoryClass(iconData: FontAwesomeIcons.heart, title: "s12".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.bookAtlas, title: "s13".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.earthAsia, title: "s14".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.lightbulb, title: "s15".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.personBreastfeeding,
                title: "s17".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.buildingColumns, title: "s18".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.chartSimple, title: "s20".tr),
            CategoryClass(iconData: FontAwesomeIcons.flask, title: "s21".tr),
            CategoryClass(iconData: FontAwesomeIcons.spa, title: "s11".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.piggyBank, title: "s22".tr),
            CategoryClass(iconData: FontAwesomeIcons.leaf, title: "s16".tr),
            CategoryClass(iconData: FontAwesomeIcons.atom, title: "s10".tr),
            CategoryClass(iconData: FontAwesomeIcons.lightbulb, title: "s7".tr),
            CategoryClass(
                iconData: FontAwesomeIcons.handsPraying, title: "s23".tr),
          ])
        ],
      ),
    );
  }
}
