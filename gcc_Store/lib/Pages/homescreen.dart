import 'package:flutter/material.dart';
import 'package:gcc/Pages/Homescreen/more.dart';
import 'package:gcc/Pages/Homescreen/product.dart';
import 'package:gcc/Pages/Homescreen/section.dart';
import 'package:gcc/Pages/Homescreen/favourite.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/homescreen.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/controller/homescreencontroller.dart';
import 'package:gcc/services/services.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  MyServices myServices = Get.find();

  getdata() {
    if (myServices.sharedPreferences.getString("login") == "1") {
      All.id.text = myServices.sharedPreferences.getString("id")!;
      All.profileimage.text = myServices.sharedPreferences.getString("ImgURL")!;
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp);
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
          extendBody: true, //<------like this
          bottomNavigationBar: Container(
            margin: const EdgeInsets.all(20),
            height: Get.width * .120,
            decoration: BoxDecoration(
              color: ColorsClass.bottomNavigationBarbg,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: Get.width * .024),
              itemBuilder: (context, index) => InkWell(
                onTap: () => controller.changepage(index),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: index == controller.i ? 0 : Get.width * .029,
                        right: Get.width * .0422,
                        left: Get.width * .0422,
                      ),
                      width: Get.width * .128,
                      height: index == controller.i ? Get.width * .014 : 0,
                      decoration: BoxDecoration(
                        color: ColorsClass.bottomNavigationBarselected,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(50),
                        ),
                      ),
                    ),
                    Icon(
                      HomescreenClass.listOfIcons[index],
                      size: Get.width * .060,
                      color: index == controller.i
                          ? ColorsClass.bottomNavigationBarselected
                          : Colors.white,
                    ),
                    SizedBox(height: Get.width * .03),
                  ],
                ),
              ),
            ),
          ),
          body: Directionality(
            textDirection: LanguageClass.lang.text == "English"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: PageView(
              controller: HomeScreenControllerImp.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [ProductScreen(), Section(), Favourite(), More()],
            ),
          ));
    });
  }
}
