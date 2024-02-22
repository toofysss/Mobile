import 'package:flutter/material.dart';
import 'package:get/get.dart';

// تغيير صفحات
abstract class AzkarController extends GetxController {
  changepage(int currentPage);
}

class AzkarControllerImp extends AzkarController {
  int i = 0;
  PageController pageController = PageController();

  @override
  changepage(int currentPage) {
    pageController.jumpToPage(
      currentPage,
    );
    i = currentPage;
    FocusScope.of(Get.context!).unfocus();
    update();
  }
}
