class BaseLink {
  static const domain = 'https://thedaywedding-hkaybdgafndhecbn.southeastasia-01.azurewebsites.net';
  static const loginWithEmailPassword = '$domain/auth/login';
  static const loginWithGoogle= '$domain/auth/loginGoogle';
  static const personalSupplier= '$domain/account/getSupplierProfile';
  static const personalCouple= '$domain/account/getCoupleProfile';
  static const updateProfileSupplier= '$domain/account/updateSupplierProfile';
  static const updateProfileCouple= '$domain/account/updateCoupleProfile';


  //


  static const listBookingCoupleRole = '$domain/booking/getByCouple';
  static const listBookingSupplierRole = '$domain/booking/getBySupplier';
  static const bookingById = '$domain/booking/getById';
  static const bookingByIdForSupplier = '$domain/booking/getBookingDetailBySupplierAndBooking';


  static const cancelBooking = '$domain/booking/cancle';
  static const cancelService = '$domain/booking-service/cancle';
  //Supllier
  static const confirmService = '$domain/booking-service/confirm';
  static const rejectService = '$domain/booking-service/reject';
  static const completeService = '$domain/booking-service/complete';
  static const processingService = '$domain/booking-service/processing';

  //







}