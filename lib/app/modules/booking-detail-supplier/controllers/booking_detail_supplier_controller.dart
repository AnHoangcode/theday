import 'dart:developer';

import 'package:get/get.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/common/service/booking_service.dart';
import 'package:theday/app/modules/nav-home/controllers/nav_home_controller.dart';
import 'package:theday/app/resource/util_common.dart';

class BookingDetailSupplierController extends GetxController {
  //TODO: Implement BookingDetailController

  final count = 0.obs;
  BookingDetailSupplierController({required this.idBooking});
  final String idBooking;

  Rx<Booking> bookingData = Booking().obs;

  BookingService service = BookingService();

  final isLoading = true.obs;
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
    service.fetchBookingById(idBooking: idBooking).then((booking) {
      bookingData.value = booking;
      isLoading(false);
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }

  Future<void> confirmService({required String idService}) async {
    service.confirmService(idService: idService).then((check) {
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      isLoading(false);
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }
  Future<void> completeService({required String idService}) async {
    service.completeService(idService: idService).then((check) {
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      isLoading(false);
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }
  Future<void> rejectService({required String idService}) async {
     service.rejectService(idService: idService).then((check) {
      UtilCommon.snackBar(text: 'Cập nhật thành công');
      isLoading(false);
    }).catchError((error) async {
      isLoading(false);
      log('$error');
    });
  }

  //Confirm/Reject => ? Confirm => complete
}
