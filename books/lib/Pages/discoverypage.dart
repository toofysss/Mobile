import 'package:books/Design/card.dart';
import 'package:books/constant/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            CustomListCard(
                header: "s1".tr, item: DataClass.psychology[0].items!),
            CustomListCard(header: "s12".tr, item: DataClass.love[0].items!),
            CustomListCard(header: "s18".tr, item: DataClass.history[0].items!),
            CustomListCard(
                header: "s19".tr, item: DataClass.eduction[0].items!),
            CustomListCard(header: "s21".tr, item: DataClass.science[0].items!),
          ],
        ));
  }
}
