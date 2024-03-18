import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:lawdashboard/Data/homescreen.dart';
import 'package:lawdashboard/constant/root.dart';
import 'package:lawdashboard/localization/Transition.dart';
import 'package:lawdashboard/localization/changelocal.dart';
import 'package:lawdashboard/services/services.dart';
import 'package:lawdashboard/widget/customtext.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
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
        nextScreen: const Homescreen(),
        splashIconSize: Get.width,
        backgroundColor: Colors.white,
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

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Root.backgroundApp,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
            color: Root.headercolor,
            data: "1".tr,
            size: Root.headersize,
            textOverflow: TextOverflow.clip),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  HomeScreenClass.services.length,
                  (index) => GestureDetector(
                        onTap: HomeScreenClass.services[index].ontap,
                        child: Container(
                          width: Get.width * .9,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.1, 0.9],
                              colors: [
                                Color.fromARGB(255, 0, 109, 103),
                                Color.fromARGB(255, 0, 109, 103),
                              ],
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                                color: Root.tabtextcolor,
                                data: HomeScreenClass.services[index].title,
                                size: Root.headersize,
                                textOverflow: TextOverflow.clip),
                          ),
                        ),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
