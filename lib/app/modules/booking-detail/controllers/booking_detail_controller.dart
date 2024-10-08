import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/common/service/booking_service.dart';
import 'package:theday/app/modules/home/controllers/home_controller.dart';
import 'package:theday/app/modules/nav-home/controllers/nav_home_controller.dart';
import 'package:theday/app/resource/util_common.dart';

class BookingDetailController extends GetxController {
  //TODO: Implement BookingDetailController

  final count = 0.obs;
  BookingDetailController({required this.idBooking});
  final String idBooking;

  Rx<Booking> bookingData = Booking().obs;

  BookingService service = BookingService();

  final isLoading = true.obs;
  final isLockButtonCancel = false.obs;

  List<String> templateReasonCancel = [
    "Không đủ nguồn lực",
    "Không tiện",
    "Khác"
  ];
  TextEditingController textEdittingController =
      TextEditingController(text: '');

  Rx<String> reasonChoice = 'Khác'.obs;
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
    isLoading(true);
    service.fetchBookingById(idBooking: idBooking).then((booking) {
      bookingData.value = booking;
      isLoading(false);
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }

  Future<void> cancelService({required String idService}) async {
    Get.back();
    Get.back();
    isLockButtonCancel.value = true;
    String reason = reasonChoice.value;
    if (reasonChoice.value == 'Khác') {
      reason = textEdittingController.text;
    }
    service.cancelService(idService: idService, note: reason).then((check) async{
      isLockButtonCancel.value = false;
      UtilCommon.snackBar(text: 'Huỷ thành công');
      initData();
      Get.find<NavHomeController>().initData();
    }).catchError((error) async {
      isLockButtonCancel.value = false;
      isLoading(false);
      log('$error');
    });
  }

  Future<void> cancelBooking({required String idBooking}) async {
    Get.back();
    isLockButtonCancel.value = true;
    String reason = reasonChoice.value;
    if (reasonChoice.value == 'Khác') {
      reason = textEdittingController.text;
    }
    service.cancelBooking(idBooking: idBooking, note: reason).then((check) {
      isLockButtonCancel.value = false;
      Get.find<NavHomeController>().initData();
      Get.back();
      UtilCommon.snackBar(text: 'Huỷ thành công');
       Get.find<NavHomeController>().initData();
      isLoading(false);
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }
}
