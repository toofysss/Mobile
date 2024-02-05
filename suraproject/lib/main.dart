import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suraproject/Root/root.dart';
import 'package:suraproject/Widget/customtext.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sura Project',
        home: SplashImage());
  }
}

class SplashImage extends StatelessWidget {
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        duration: 100,
        backgroundColor: Root.primary,
        nextScreen: const HomePage(),
        splashIconSize: Get.width,
        splashTransition: SplashTransition.fadeTransition,
        splash: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(Root.spalshimage), fit: BoxFit.fill)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Root.primary,
      appBar: AppBar(
        backgroundColor: Root.primary,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              Root.spalshimage,
              height: Get.width / 8,
            ),
            Center(
              child: CustomText(
                  color: Root.secondry2,
                  data: "IACED Membership",
                  size: Root.headersize,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: GridView.builder(
        itemCount: LayerClass.data.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 200,
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 15),
        itemBuilder: (context, index) => GestureDetector(
          onTap: LayerClass.data[index].onTap,
          child: Container(
            margin: const EdgeInsets.all(15),
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      LayerClass.data[index].startcolor,
                      LayerClass.data[index].endcolor
                    ])),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Root.secondry.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LayerClass.data[index].icon,
                      size: 40,
                      color: Root.secondry,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CustomText(
                      color: Root.secondry,
                      data: LayerClass.data[index].title,
                      size: Root.headersize,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
