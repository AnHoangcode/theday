import 'package:get/get.dart';

import '../controllers/nav_home_controller.dart';

class NavHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavHomeController>(
      () => NavHomeController(),
    );
  }
}
