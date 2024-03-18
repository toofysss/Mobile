import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/homescreencontroller.dart';
import 'package:movies_app/contsant/root.dart';
import 'package:movies_app/localization/Transition.dart';
import 'package:movies_app/localization/changelocal.dart';
import 'package:movies_app/pages/home.dart';
import 'package:movies_app/pages/profile.dart';
import 'package:movies_app/pages/search.dart';
import 'package:movies_app/pages/section.dart';
import 'package:movies_app/services/services.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          // locale: controller.language,
          translations: MyTransition(),
          initialBinding: BindingsBuilder(() {
            Get.put(LocalController());
          }),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen());
    
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
        backgroundColor: Root.appbg,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'CINE',
                  style: TextStyle(
                      color: Root.colorSeclectBottom,
                      fontWeight: FontWeight.bold,
                      fontSize: Root.textsize + 10),
                ),
                TextSpan(
                  text: 'BOX',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Root.textsize + 10),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Directionality(
          textDirection: TextDirection.ltr,
          child: BottomBarBubble(
            backgroundColor: Root.bottomBg,
            color: Root.colorSeclectBottom,
            selectedIndex: controller.i,
            items: List.generate(
                HomeScreenClass.bottomlist.length,
                (index) => BottomBarItem(
                    iconSize: Root.iconsizeBottom,
                    iconData: HomeScreenClass.bottomlist[index])),
            onSelect: (index) => controller.changepage(index),
          ),
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [Home(), Section(), Search(), Profile()],
        ),
      );
    });
  }
}
