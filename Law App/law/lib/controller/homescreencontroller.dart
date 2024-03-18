import 'package:flutter/material.dart';
import 'package:get/get.dart';

// تغيير صفحات
abstract class HomeScreenController extends GetxController {
  changepage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int i = 0;
  PageController pageController = PageController();

  @override
  changepage(int currentPage) {
    FocusScope.of(Get.context!).unfocus();

    i = currentPage;
    pageController.jumpToPage(i);
    update();
  }
}
