// ?coupleId=COUPLE-2&isAscending=true&pageNo=0&pageSize=10&sortBy=id
import 'package:theday/app/common/base_link.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/common/service/api_service.dart';

class BookingService extends ApiService {
  Future<List<dynamic>> fetchListBookingCoupleRole(
      {required String coupleId, String params = ''}) async {
        List<Booking> listBooking =await fetchDataList(BaseLink.listBookingCoupleRole+'?coupleId=$coupleId',(p0) => Booking.fromJson(p0),);
    return listBooking;
  }
}
