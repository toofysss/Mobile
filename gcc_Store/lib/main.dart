import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gcc/Pages/homescreen.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/localization/Transition.dart';
import 'package:gcc/localization/changelocal.dart';
import 'package:gcc/services/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTransition(),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 100,
        nextScreen: const Homescreen(),
        splashIconSize: 300,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.fadeTransition,
        splash: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(All.splashImage), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
