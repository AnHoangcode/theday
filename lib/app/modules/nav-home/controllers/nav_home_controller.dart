import 'dart:developer';

import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/service/booking_service.dart';
import 'package:theday/app/resource/util_common.dart';

class NavHomeController extends GetxController {
  //TODO: Implement NavHomeController
  RxList<dynamic> listBooking = <dynamic>[].obs;
  final isLoading = true.obs;
  BookingService service = BookingService();
  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initData() async {
    String userId = BaseCommon.instance.accountSession?.userId ?? '';
    service.fetchListBookingCoupleRole(coupleId: userId).then((value) {
      listBooking.value = value;
      isLoading(false);
    }).catchError((error) {
      isLoading(false);
      listBooking.value = [];
      log('$error');
      // UtilCommon.snackBar(text: '$error', isFail: true);
    });
    ;
  }
}
