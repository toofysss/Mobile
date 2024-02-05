import 'package:get/get.dart';

// تغيير صفحات
abstract class HomeScreenController extends GetxController {
  filterdata(String data);
}

class HomeScreenControllerImp extends HomeScreenController {
  @override
  filterdata(String data) {
    update();
  }
}
