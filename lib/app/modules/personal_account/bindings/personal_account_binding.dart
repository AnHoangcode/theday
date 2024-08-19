import 'package:get/get.dart';

import '../controllers/personal_account_controller.dart';

class PersonalAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalAccountController>(
      () => PersonalAccountController(),
    );
  }
}
