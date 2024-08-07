import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_detail_supplier_controller.dart';

class BookingDetailSupplierView
    extends GetView<BookingDetailSupplierController> {
  const BookingDetailSupplierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingDetailSupplierView'),
        centerTitle: true,
      ),
      body: Center(
          child: OutlinedButton(
              onPressed: () async {
                await controller.completeService(idService: 'BOOKING-DETAIL-2');
              },
              child: Text('CHECK'))),
    );
  }
}
