import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/common/model/booking_detail_supplier.dart';
import 'package:theday/app/common/service/booking_service.dart';
import 'package:theday/app/modules/nav-home/controllers/nav_home_controller.dart';
import 'package:theday/app/resource/util_common.dart';

class BookingDetailSupplierController extends GetxController {
  //TODO: Implement BookingDetailController

  final isLockUpdate = false.obs;
  BookingDetailSupplierController({required this.idBooking});
  final String idBooking;

  RxList<BookingDetailSupplier> bookingData = <BookingDetailSupplier>[].obs;

  BookingService service = BookingService();

  final isLoading = true.obs;
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

  void initData(){
   isLoading(true);
    service.fetchBookingByIdForSupplier(bookingId: idBooking, supplierId: BaseCommon.instance.accountSession!.userId!).then((booking) {
      bookingData.value = booking;
      isLoading(false);
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });;
  }

  Future<void> confirmService({required String idService}) async {
    service.confirmService(idService: idService).then((check) {
      Get.back();
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      initData();
    }).catchError((error) async {
      log('$error');
    });
  }
  Future<void> completeService({required String idService}) async {
    service.completeService(idService: idService).then((check) {
      Get.back();
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      initData();
    }).catchError((error) async {
      initData();
      log('$error');
    });
  }
    Future<void> processingService({required String idService}) async {
    service.processService(idService: idService).then((check) {
      Get.back();
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      initData();
    }).catchError((error) async {
      log('$error');
    });
  }
  Future<void> rejectService({required String idService}) async {
     String reason = reasonChoice.value;
    if (reasonChoice.value == 'Khác') {
      reason = textEdittingController.text;
    }
     service.rejectService(idService: idService, note: reason).then((check) {
      Get.back();
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      initData();
    }).catchError((error) async {
      log('$error');
    });
  }

  //Confirm/Reject => ? Confirm => complete
}
