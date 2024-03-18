import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Page/blog/blog.dart';
import 'package:law/Page/law/law.dart';
import 'package:law/Page/Section/section.dart';
import 'package:law/Page/services.dart';
import 'package:law/Page/setting.dart';
import 'package:law/contant/root.dart';
import 'package:law/localization/Transition.dart';
import 'package:law/localization/changelocal.dart';
import 'package:law/services/services.dart';
import 'controller/homescreencontroller.dart';

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
    final localController = Get.put(LocalController());
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.green,
            backgroundColor: Colors.transparent,
            elevation: 0),
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
          primary: Color(0xff38499e),
          secondary: Color(0xff38499e),
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
      locale: localController.language,
      translations: MyTransition(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        duration: 100,
        nextScreen: const HomeScreen(),
        splashIconSize: Get.width,
        backgroundColor: Colors.black,
        splashTransition: SplashTransition.fadeTransition,
        splash: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Root.logo), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        init: HomeScreenControllerImp(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(centerTitle: true, actions: [
              Container(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () => Get.to(
                    () => const Setting(),
                    transition: Transition.fadeIn,
                  ),
                  child: Icon(
                    Icons.settings,
                    size: 25,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ]),
            bottomNavigationBar: FlashyTabBar(
                selectedIndex: controller.i,
                backgroundColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                showElevation: false,
                onItemSelected: (index) => controller.changepage(index),
                items: List.generate(
                  Data.listitem.length,
                  (index) => FlashyTabBarItem(
                      icon: Icon(
                        Data.listitem[index].iconData,
                        size: 30,
                      ),
                      title: Text(
                        Data.listitem[index].title,
                        style: TextStyle(fontSize: Get.width / 26),
                      ),
                      activeColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .selectedItemColor!),
                )),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: const [Law(), Blog(), Section(), Services()],
            ),
          );
        });
  }
}
