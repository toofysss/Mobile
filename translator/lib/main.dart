import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:translator/Page/onboarding.dart';
import 'package:translator/localization/changelocal.dart';
import 'localization/translation.dart';
import 'services/services.dart';

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
    return GetBuilder<LocalController>(
        init: LocalController(),
        builder: (controller) {
          return GetMaterialApp(
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
                scaffoldBackgroundColor: const Color(0xff1f242d),
                primaryColor: Colors.white,
                buttonTheme: ButtonThemeData(
                    colorScheme: ColorScheme.dark(
                        background: const Color.fromARGB(255, 52, 131, 156)
                            .withOpacity(.8),
                        primary: const Color.fromARGB(255, 103, 194, 221))),
                iconTheme: const IconThemeData(color: Colors.white)),
            locale: controller.language,
            debugShowCheckedModeBanner: false,
            translations: MyTransition(),
            home: const Onboarding(),
          );
        });
  }
}
