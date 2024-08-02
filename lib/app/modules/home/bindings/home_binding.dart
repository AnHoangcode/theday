import 'package:get/get.dart';
import 'package:theday/app/modules/nav-home/controllers/nav_home_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<NavHomeController>(
      () => NavHomeController(),
    );
  }
}
