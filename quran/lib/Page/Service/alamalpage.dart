import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/Design/alamaldesign.dart';
import 'package:quran/constant/data.dart';
import 'package:quran/constant/root.dart';

class AlamalPage extends StatelessWidget {
  const AlamalPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("S18".tr),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: Root.iconsize - 3,
          ),
        ),
      ),
      body: DefaultTabController(
          length: 12,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                unselectedLabelColor:
                    Theme.of(context).primaryColor.withOpacity(.7),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: "Alamal0".tr,
                  ),
                  Tab(
                    text: "Alamal1".tr,
                  ),
                  Tab(
                    text: "Alamal2".tr,
                  ),
                  Tab(
                    text: "Alamal3".tr,
                  ),
                  Tab(
                    text: "Alamal4".tr,
                  ),
                  Tab(
                    text: "Alamal5".tr,
                  ),
                  Tab(
                    text: "Alamal6".tr,
                  ),
                  Tab(
                    text: "Alamal7".tr,
                  ),
                  Tab(
                    text: "Alamal8".tr,
                  ),
                  Tab(
                    text: "Alamal9".tr,
                  ),
                  Tab(
                    text: "Alamal10".tr,
                  ),
                  Tab(
                    text: "Alamal11".tr,
                  ),
                ],
                labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: Root.fontsize,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    AlamalDesign(data: AlamalList.muharram),
                    AlamalDesign(data: AlamalList.safar),
                    AlamalDesign(data: AlamalList.rabiAlAwwal),
                    AlamalDesign(data: AlamalList.rabialAlthaani),
                    AlamalDesign(data: AlamalList.jumadaAlAwwal),
                    AlamalDesign(data: AlamalList.jumadaAlthanni),
                    AlamalDesign(data: AlamalList.rajab),
                    AlamalDesign(data: AlamalList.shaaban),
                    AlamalDesign(data: AlamalList.ramadhan),
                    AlamalDesign(data: AlamalList.shawwal),
                    AlamalDesign(data: AlamalList.dhulQadah),
                    AlamalDesign(data: AlamalList.dhuAlHijjah),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
