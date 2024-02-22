import 'package:flutter/material.dart';
import 'package:get/get.dart';

// تغيير صفحات
abstract class DuaaController extends GetxController {
  changepage(int currentPage);
}

class DuaaControllerImp extends DuaaController {
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
