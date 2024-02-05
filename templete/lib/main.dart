import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:templete/Pages/home.dart';
import 'package:templete/Pages/profile.dart';
import 'package:templete/Pages/search.dart';
import 'package:templete/Pages/section.dart';
import 'package:templete/constant/constant.dart';
import 'package:templete/controller/homescreencontroller.dart';
import 'package:templete/localization/Transition.dart';
import 'package:templete/localization/changelocal.dart';
import 'package:templete/services/services.dart';
import 'package:templete/widget/customtext.dart';

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
      home: const Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    SectionClass.getSection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp);
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Directionality(
        textDirection: LanguageClass.lang.text == "English"
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Root.bg,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: CusomtText(
                data: "1".tr,
                size: Root.textsize,
                color: Root.textcolor,
              ),
            ),
            bottomNavigationBar: SlidingClippedNavBar(
                backgroundColor: Colors.white,
                onButtonPressed: (index) => controller.changepage(index),
                iconSize: 30,
                activeColor: Root.bg,
                selectedIndex: controller.i,
                barItems: List.generate(
                  Data.iconList.length,
                  (index) => BarItem(
                    icon: Data.iconList[index].icons!,
                    title: Data.iconList[index].title,
                  ),
                )),
            body: PageView(
              controller: HomeScreenControllerImp.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [HomePage(), Section(), Search(), Profile()],
            )),
      );
    });
  }
}
