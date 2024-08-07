import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/account.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/common/model/service_supplier_model.dart';
import 'package:theday/app/common/service/booking_service.dart';
import 'package:theday/app/resource/util_common.dart';
import 'package:theday/app/routes/app_pages.dart';

class NavHomeController extends GetxController {
  //TODO: Implement NavHomeController
  RxList<Booking> listBooking = <Booking>[].obs;
  RxList<ServiceSupplierModel> listService = <ServiceSupplierModel>[].obs;

  final isLoading = true.obs;
  final isLockUpdate = false.obs;

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
    String role = BaseCommon.instance.accountSession?.roleName ?? '';
    isLoading(true);
    if (role == coupleRole) {
      service.fetchListBookingCoupleRole(coupleId: userId).then((value) {
        listBooking.value = value;
        isLoading(false);
      }).catchError((error) async {
        isLoading(false);
        listBooking.value = [];
        log('$error');
        // UtilCommon.snackBar(text: '$error', isFail: true);
      });
    } else {
      service.fetchListBookingSupplierRole(supplierId: userId).then((value) {
        listService.value = value;
        isLoading(false);
      }).catchError((error) async {
        isLoading(false);
        listService.value = [];
        log('$error');
        // UtilCommon.snackBar(text: '$error', isFail: true);
      });
    }

    ;
  }

  //test mockup data


  onTapCardBooking({required String idBooking}) {
    String role = BaseCommon.instance.accountSession?.roleName ?? '';
    if (role == coupleRole) {
      Get.toNamed(Routes.BOOKING_DETAIL, arguments: idBooking);
    } else {
      Get.toNamed(Routes.BOOKING_DETAIL_SUPPLIER, arguments: idBooking);
    }
  }

  Future<void> confirmService({required String idService}) async {
    isLockUpdate.value = true;
    service.confirmService(idService: idService).then((check) {
      Get.back();
      isLockUpdate.value = false;
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      initData();
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }
  Future<void> completeService({required String idService}) async {
    isLockUpdate.value = true;
    service.completeService(idService: idService).then((check) {
      Get.back();
      isLockUpdate.value = false;
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      initData();
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }
  Future<void> rejectService({required String idService}) async {
    isLockUpdate.value = true;
     service.rejectService(idService: idService).then((check) {
     Get.back();
      isLockUpdate.value = false;
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      initData();
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }
}
