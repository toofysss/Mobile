import 'package:books/constant/home.dart';
import 'package:books/constant/root.dart';
import 'package:books/controller/homescreencontroller.dart';
import 'package:books/localization/Transition.dart';
import 'package:books/localization/changelocal.dart';
import 'package:books/services/services.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocalController());

    return GetBuilder<LocalController>(builder: (controller) {
      return GetMaterialApp(
        theme: ThemeData(
          primaryColor: ThemeDataClass.textDark,
          splashColor: Colors.transparent,
          scaffoldBackgroundColor: const Color(0xffF2F6FB),
          // border of container
          cardColor: Colors.white,
          // shadow of container
          shadowColor: const Color(0xFFD3D3D3)..withOpacity(.84),
          iconTheme: const IconThemeData(color: Color(0xff38499e)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.white,
              backgroundColor: Color(0xff38499e)),
          // Color of gradient container
          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Colors.white,
          ),
          // text Color
          focusColor: ThemeDataClass.textLight,
          // Button Color
          indicatorColor: const Color(0xff38499e),
        ),
        themeMode: Root.themeMode,
        darkTheme: ThemeData(
            primaryColor: ThemeDataClass.textDark,
            brightness: Brightness.dark,
            // text Color
            focusColor: ThemeDataClass.textDark,
            // shadow of container
            shadowColor: Colors.transparent,
            // border of container
            cardColor: Colors.white.withOpacity(.15),
            iconTheme: IconThemeData(color: ThemeDataClass.textDark),
            // Color Of Gradient
            colorScheme: ColorScheme.dark(
                primary: Colors.white.withOpacity(.15),
                brightness: Brightness.dark,
                secondary: Colors.white.withOpacity(.05)),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                selectedItemColor: Color(0xfffa2f31),
                backgroundColor: Color(0xff10152b)),
            scaffoldBackgroundColor: const Color(0xff10152b),
            // Button Color
            splashColor: Colors.transparent,
            // Button Color
            indicatorColor: const Color(0xfffa2f31)),
        locale: controller.language,
        debugShowCheckedModeBanner: false,
        translations: MyTransition(),
        home: const FirstPage(),
      );
    });
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: BottomBarDoubleBullet(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
              color:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
              selectedIndex: controller.i,
              items: List.generate(
                HomeClass.bottomList.length,
                (index) => BottomBarItem(
                    iconData: HomeClass.bottomList[index],
                    iconSize: Root.iconsize),
              ),
              onSelect: (index) => controller.changepage(index),
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: PageView.builder(
                itemCount: HomeClass.pages.length,
                controller: controller.pageController,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => HomeClass.pages[index]),
          ));
    });
  }
}

