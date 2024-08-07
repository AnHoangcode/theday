import 'package:get/get.dart';

import '../controllers/booking_detail_supplier_controller.dart';

class BookingDetailSupplierBinding extends Bindings {
  @override
  void dependencies() {
      final idBooking = Get.arguments as String;
    Get.lazyPut<BookingDetailSupplierController>(
      () => BookingDetailSupplierController(idBooking: idBooking),
    );
  }
}
