import 'package:get/get.dart';
import 'package:theday/app/common/model/booking.dart';

import '../controllers/booking_detail_controller.dart';

class BookingDetailBinding extends Bindings {
  @override
  void dependencies() {
    final booking = Get.arguments as Booking;
    Get.lazyPut<BookingDetailController>(
      () => BookingDetailController(bookingData: booking),
    );
  }
}
