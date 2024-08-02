import 'package:get/get.dart';

import '../controllers/nav_account_controller.dart';

class NavAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavAccountController>(
      () => NavAccountController(),
    );
  }
}
