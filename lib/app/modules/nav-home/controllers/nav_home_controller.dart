import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/booking.dart';
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
    }).catchError((error) async{
      listBooking.value = await readJson();
      isLoading(false);
      // listBooking.value = [];
      log('$error');
      // UtilCommon.snackBar(text: '$error', isFail: true);
    });
    ;
  }

  //test mockup data 
Future<List<Booking>> readJson() async {
  try {
    final String response = await rootBundle.loadString('assets/booking_mockup.json');
  final List<dynamic> data = await json.decode(response)['data'];
   return    data.map<Booking>((item) => Booking.fromJson(item)).toList();
  } catch (e) {
    log('message $e');
  }
  return [];
}
}
