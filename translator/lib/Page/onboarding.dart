import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/Page/homepage.dart';
import 'package:translator/UI/bgdesign.dart';

class OnboardingController extends GetxController {
  bool animations = false;

  @override
  void onInit() {
    animation();
    super.onInit();
  }

  animation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animations = true;
      update();
    });
  }

  getStart() => Get.offAll(() => const HomePage(),
      transition: Transition.zoom, duration: const Duration(milliseconds: 600));
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (controller) {
          return Scaffold(
              body: BgDesign(
            page: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 700),
                      transform: Matrix4.translationValues(
                          0, controller.animations ? 0 : Get.width, 0),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Hello".tr,
                            style: TextStyle(
                                fontSize: Get.width / 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "Name".tr,
                            style: TextStyle(
                                fontSize: Get.width / 16,
                                color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme!
                                    .primary,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${"\n"}${"Title".tr}",
                            style: TextStyle(
                                fontSize: Get.width / 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "${"\n\n"}${"Subtitle".tr}",
                            style: TextStyle(
                                fontSize: Get.width / 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold)),
                      ])),
                    ),
                    const Spacer(),
                    AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 900),
                      transform: Matrix4.translationValues(
                          0, controller.animations ? 0 : Get.width, 0),
                      child: GestureDetector(
                        onTap: () => controller.getStart(),
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context)
                                .buttonTheme
                                .colorScheme!
                                .background,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text("get started",
                              style: TextStyle(
                                  fontSize: Get.width / 16,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
