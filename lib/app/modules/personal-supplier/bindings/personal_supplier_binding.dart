import 'package:get/get.dart';

import '../controllers/personal_supplier_controller.dart';

class PersonalSupplierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalSupplierController>(
      () => PersonalSupplierController(),
    );
  }
}
