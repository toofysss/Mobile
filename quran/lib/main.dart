import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran/constant/home.dart';
import 'constant/root.dart';
import 'controller/homescreencontroller.dart';
import 'localization/Transition.dart';
import 'localization/changelocal.dart';
import 'services/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalController>(
        init: LocalController(),
        builder: (controller) {
          return GetMaterialApp(
            theme: ThemeData(
                brightness: Brightness.light,
                // text Color
                secondaryHeaderColor: const Color(0xFF275B6B),
                primaryColor: ThemeDataClass.textLight,
                scaffoldBackgroundColor: const Color(0xfff9f9f9),
                // shadow of container
                shadowColor: const Color(0xFFD3D3D3)..withOpacity(.84),
                iconTheme: IconThemeData(color: ThemeDataClass.textLight),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Color(0xFF275B6B),
                    backgroundColor: Color(0xfff9f9f9)),
                // Button Color
                indicatorColor: const Color(0xff468396),
                buttonTheme: const ButtonThemeData(
                  colorScheme: ColorScheme.light(primary: Color(0xFF275B6B)),
                )),
            themeMode: Root.themeMode,
            darkTheme: ThemeData(
                // text Color
                primaryColor: ThemeDataClass.textDark,
                brightness: Brightness.dark,
                // shadow of container
                shadowColor: Colors.transparent,
                iconTheme: IconThemeData(color: ThemeDataClass.textDark),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Color(0xfffa2f31),
                    backgroundColor: Color(0xff10152b)),
                scaffoldBackgroundColor: const Color(0xff161E29),
                // Button Color
                indicatorColor: const Color(0xffC0E2EE)),
            locale: controller.language,
            debugShowCheckedModeBanner: false,
            translations: MyTransition(),
            home: const HomeScreen(),
          );
        });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        init: HomeScreenControllerImp(),
        builder: (controller) {
          return Scaffold(
              bottomNavigationBar: Container(
                  margin: const EdgeInsets.all(20),
                  height: Get.width * .120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      HomeClass.bottomList.length,
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
                                bottom: index == controller.i
                                    ? 0
                                    : Get.width * .029,
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
                              HomeClass.bottomList[index],
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
