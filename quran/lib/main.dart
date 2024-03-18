import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:quran/Page/homepage.dart';
import 'constant/root.dart';
import 'localization/Transition.dart';
import 'localization/changelocal.dart';
import 'services/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  initializeDateFormatting();
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
            themeMode: Root.themeMode,
            theme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              scaffoldBackgroundColor: const Color(0xffffffff),
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  iconTheme: const IconThemeData(color: Colors.black)),
              colorScheme: ColorScheme.light(
                  tertiary: Colors.white,
                  onPrimary: const Color(0xffDCB86C),
                  shadow: const Color(0xFFD3D3D3)..withOpacity(.84),
                  primary: const Color(0XFF006D43),
                  secondary: const Color(0xffEDF9EF)),
              primaryColor: Colors.black,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  elevation: 0,
                  selectedItemColor: Color(0XFFDED473),
                  backgroundColor: Color(0XFF006D43)),
            ),
            darkTheme: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  iconTheme: const IconThemeData(color: Colors.white)),
              primaryColor: Colors.white,
              shadowColor: const Color(0xFFD3D3D3)..withOpacity(.84),
              colorScheme: ColorScheme.dark(
                  tertiary: Colors.white,
                  onPrimary: const Color(0xffDCB86C),
                  shadow: Colors.transparent,
                  primary: const Color(0xffC0E2EE),
                  secondary: const Color(0xffC0E2EE).withOpacity(.2)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: const Color(0xffDCB86C),
                  backgroundColor: const Color(0xff3A78A7).withOpacity(.2)),
              scaffoldBackgroundColor: const Color(0xff161E29),
            ),
            locale: controller.language,
            debugShowCheckedModeBanner: false,
            translations: MyTransition(),
            home: const HomeScreen(),
          );
        });
  }
}
