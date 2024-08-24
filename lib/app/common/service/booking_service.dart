// ?coupleId=COUPLE-2&isAscending=true&pageNo=0&pageSize=10&sortBy=id
import 'package:theday/app/common/base_link.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/common/model/booking_detail_supplier.dart';
import 'package:theday/app/common/model/booking_overview_supplier.dart';
import 'package:theday/app/common/model/service_supplier_model.dart';
import 'package:theday/app/common/service/api_service.dart';

class BookingService extends ApiService {
  Future<List<Booking>> fetchListBookingCoupleRole(
      {required String coupleId, String params = ''}) async {
    List<Booking> listBooking = await fetchDataList(
      '${BaseLink.listBookingCoupleRole}?coupleId=$coupleId',
      (p0) => Booking.fromJson(p0),
    );
    return listBooking;
  }

  Future<List<BookingOverViewSupplier>> fetchListBookingSupplierRole(
      {required String supplierId, String params = ''}) async {
    List<BookingOverViewSupplier> listBooking = await fetchDataList(
      '${BaseLink.listBookingSupplierRole}?supplierId=$supplierId',
      (p0) => BookingOverViewSupplier.fromJson(p0),
    );
    return listBooking;
  }

  Future<Booking> fetchBookingById({required String idBooking}) async {
    Booking booking = await fetchDataObject(
      '${BaseLink.bookingById}?id=$idBooking',
      (p0) => Booking.fromJson(p0),
    );
    return booking;
  }

  Future<List<BookingDetailSupplier>> fetchBookingByIdForSupplier(
      {required String bookingId, required String supplierId}) async {
    List<BookingDetailSupplier> booking = await fetchDataList(
      '${BaseLink.bookingByIdForSupplier}?bookingId=$bookingId&supplierId=$supplierId',
      (p0) => BookingDetailSupplier.fromJson(p0),
    );
    return booking;
  }

  Future<bool> cancelService(
      {required String idService, String note = ''}) async {
    bool check = await validationWithPut('${BaseLink.cancelService}',
        body: {"bookingDetailId": idService, "reason": note});
    return check;
  }

  Future<bool> cancelBooking({required String idBooking, String note = ''}) async {
    bool check = await validationWithPut('${BaseLink.cancelBooking}',
        body: {"bookingDetailId": idBooking, "reason": idBooking});
    return check;
  }

  Future<bool> confirmService({required String idService}) async {
    bool check = await validationWithPut(
        '${BaseLink.confirmService}?id=$idService',
        body: {});
    return check;
  }

  Future<bool> rejectService(
      {required String idService, String note = ''}) async {
    bool check = await validationWithPut(
        '${BaseLink.rejectService}?id=$idService',
        body: {"bookingDetailId": idService, "reason": note});
    return check;
  }

  Future<bool> completeService({required String idService}) async {
    bool check = await validationWithPut(
        '${BaseLink.completeService}?id=$idService',
        body: {});
    return check;
  }

  Future<bool> processService({required String idService}) async {
    bool check = await validationWithPut(
        '${BaseLink.processingService}?id=$idService',
        body: {});
    return check;
  }
}
