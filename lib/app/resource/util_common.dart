import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';

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

 static Widget getWidgetByStatus(BuildContext context, String status) {
    String text = status;
    Color color = Colors.blue;
    switch (status) {
      case 'PENDING':
        text = 'Đang đợi';
        color = Colors.brown;
        break;
       case 'APPROVED':
        text = 'Xác nhận';
        color = Colors.blue;
        break;
      case 'CANCELLED':
        text = 'Huỷ';
        color = Colors.red;
        break;
         case 'REJECTED':
        text = 'Từ chối';
        color = Colors.red;
        break;
        case 'CANCELED':
        text = 'Đã huỷ';
        color = Colors.red;
        break;
          case 'PROCESSING':
        text = 'Đang thực hiện';
        color = Colors.blueAccent;
        break;
         case 'COMPLETED':
        text = 'Hoàn thành';
        color = Colors.green;
        break;
          case 'DEPOSITED':
        text = 'Đã cọc';
        color = Colors.amber.shade900;
        break;
        //
      default:
      text = 'Đang đợi';
        color = Colors.blue;
    }
    return Container(
      width: UtilsReponsive.width(120, context),

      padding: EdgeInsets.symmetric(
          vertical: UtilsReponsive.height(2, context),
        ),
        alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)),
      child: TextConstant.subTile3(
        context,
        size: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        text: text,
      ),
    );
  }
}
