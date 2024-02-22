import 'package:flutter/material.dart';
import 'package:get/get.dart';

// تغيير صفحات
abstract class QuranController extends GetxController {
  changepage(int currentPage);
}

class QuranControllerImp extends QuranController {
  int i = 0;
  PageController pageController = PageController();

  @override
  changepage(int currentPage) {
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    i = currentPage;
    FocusScope.of(Get.context!).unfocus();
    update();
  }
}
