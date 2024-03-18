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
            DataClass.psychology.isNotEmpty
                ? (DataClass.psychology[0].items?.isNotEmpty ?? false)
                    ? CustomListCard(
                        header: "s1".tr, item: DataClass.psychology)
                    : const SizedBox(
                        height: 290,
                      )
                : const SizedBox(
                    height: 290,
                  ),
            DataClass.love.isNotEmpty
                ? (DataClass.love[0].items?.isNotEmpty ?? false)
                    ? CustomListCard(header: "s1".tr, item: DataClass.love)
                    : const SizedBox(
                        height: 290,
                      )
                : const SizedBox(
                    height: 290,
                  ),
            DataClass.history.isNotEmpty
                ? (DataClass.history[0].items?.isNotEmpty ?? false)
                    ? CustomListCard(header: "s1".tr, item: DataClass.history)
                    : const SizedBox(
                        height: 290,
                      )
                : const SizedBox(
                    height: 290,
                  ),
            DataClass.eduction.isNotEmpty
                ? (DataClass.eduction[0].items?.isNotEmpty ?? false)
                    ? CustomListCard(header: "s1".tr, item: DataClass.eduction)
                    : const SizedBox(
                        height: 290,
                      )
                : const SizedBox(
                    height: 290,
                  ),
            DataClass.science.isNotEmpty
                ? (DataClass.science[0].items?.isNotEmpty ?? false)
                    ? CustomListCard(header: "s1".tr, item: DataClass.science)
                    : const SizedBox(
                        height: 290,
                      )
                : const SizedBox(
                    height: 290,
                  ),
          ],
        ));
  }
}
