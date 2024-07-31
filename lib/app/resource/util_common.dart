import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UtilCommon {
  static void snackBar({required String text, bool isFail = false}) {
    Get.snackbar('Thông báo', text,
        colorText: Colors.white,
        backgroundColor: isFail ? Colors.red : Colors.green);
  }

  static String convertDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String convertEEEDateTime(DateTime date) {
    return DateFormat('EEEE, dd MMMM yyyy', 'vi_VN').format(date);
  }
}
