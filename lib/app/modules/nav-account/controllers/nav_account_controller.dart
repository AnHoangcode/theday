import 'package:get/get.dart';
import 'package:theday/app/routes/app_pages.dart';

class NavAccountController extends GetxController {
  //TODO: Implement NavAccountController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  
  logout(){
    Get.offAllNamed(Routes.LOGIN);
  }
}
