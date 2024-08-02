import 'package:get/get.dart';
import 'package:theday/app/common/model/booking.dart';

class BookingDetailController extends GetxController {
  //TODO: Implement BookingDetailController

  final count = 0.obs;
  final isChoice =true.obs;
  BookingDetailController({required  this.bookingData});
 final Booking bookingData ;
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

  void increment() => count.value++;
}
