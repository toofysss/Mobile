import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:law/Data/homescreen.dart';
import 'package:law/Page/blog/blog.dart';
import 'package:law/Page/law/law.dart';
import 'package:law/Page/Section/section.dart';
import 'package:law/Page/services/services.dart';
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
      locale: localController.language,
      translations: MyTransition(),
      theme: ThemeData(scaffoldBackgroundColor: Root.backgroundApp),
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
    Get.put(HomeScreenControllerImp);
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: AnnotatedRegion(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Root.primary,
            ),
            child: Scaffold(
              extendBody: true,
              bottomNavigationBar: CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  height: 55,
                  color: Root.primary,
                  index: controller.i,
                  onTap: (value) => controller.changepage(value),
                  items: List.generate(
                    Data.listitem.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Data.listitem[index].iconData,
                        color: Root.secondry,
                        size: 28,
                      ),
                    ),
                  )),
              body: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: const [
                    Law(),
                    Blog(),
                    Section(),
                    Services(),
                    Setting()
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
