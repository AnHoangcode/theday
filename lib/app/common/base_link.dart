class BaseLink {
  static const domain = 'https://the-day-eqh7h5gwadbga9fe.eastus-01.azurewebsites.net';
  static const loginWithEmailPassword = '$domain/auth/login';
  static const listBookingCoupleRole = '$domain/booking/getByCouple';
  static const listBookingSupplierRole = '$domain/booking/getBySupplier';
  static const bookingById = '$domain/booking/getById';

  static const cancelBooking = '$domain/booking/cancle';
  static const cancelService = '$domain/booking-service/cancle';
  //Supllier
  static const confirmService = '$domain/booking-service/confirm';
  static const rejectService = '$domain/booking-service/reject';
  static const completeService = '$domain/booking-service/complete';







}