import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:quran/Page/Home/home.dart';
import 'package:quran/Page/quran.dart';
import 'package:quran/Page/setting.dart';

class HomeScreenController extends GetxController {
  int i = 0;
  PageController pageController = PageController();
  List<IconData> bottomList = [
    Icons.mosque,
    FlutterIslamicIcons.solidQuran2,
    Icons.hexagon_outlined,
  ];

  List<Widget> pages = const [
    Home(),
    Quran(),
    Setting(),
  ];
  changepage(int currentPage) {
    pageController.jumpToPage(currentPage);
    i = currentPage;
    update();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            bottomSheet: Container(
                height: Get.width * .120,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    controller.bottomList.length,
                    (index) => InkWell(
                      onTap: () => controller.changepage(index),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(
                              bottom:
                                  index == controller.i ? 0 : Get.width * .029,
                              right: Get.width * .0422,
                              left: Get.width * .0422,
                            ),
                            width: Get.width * .128,
                            height:
                                index == controller.i ? Get.width * .014 : 0,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .bottomNavigationBarTheme
                                  .selectedItemColor,
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(50),
                              ),
                            ),
                          ),
                          Icon(
                            controller.bottomList[index],
                            size: Get.width * .060,
                            color: index == controller.i
                                ? Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedItemColor
                                : Theme.of(context)
                                    .bottomNavigationBarTheme
                                    .selectedItemColor!
                                    .withOpacity(.6),
                          ),
                          SizedBox(height: Get.width * .03),
                        ],
                      ),
                    ),
                  ),
                )),
            body: PageView.builder(
                itemCount: controller.pages.length,
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => controller.pages[index]),
          );
        });
  }
}
