import 'package:get/get.dart';
import 'package:theday/app/common/model/booking.dart';

import '../controllers/booking_detail_controller.dart';

class BookingDetailBinding extends Bindings {
  @override
  void dependencies() {
    final idBooking = Get.arguments as String;
    Get.lazyPut<BookingDetailController>(
      () => BookingDetailController(idBooking: idBooking),
    );
  }
}
