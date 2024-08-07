import 'package:get/get.dart';

import '../modules/booking-detail-supplier/bindings/booking_detail_supplier_binding.dart';
import '../modules/booking-detail-supplier/views/booking_detail_supplier_view.dart';
import '../modules/booking-detail/bindings/booking_detail_binding.dart';
import '../modules/booking-detail/views/booking_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nav-account/bindings/nav_account_binding.dart';
import '../modules/nav-account/views/nav_account_view.dart';
import '../modules/nav-home/bindings/nav_home_binding.dart';
import '../modules/nav-home/views/nav_home_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.NAV_HOME,
      page: () => const NavHomeView(),
      binding: NavHomeBinding(),
    ),
    GetPage(
      name: _Paths.NAV_ACCOUNT,
      page: () => const NavAccountView(),
      binding: NavAccountBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_DETAIL,
      page: () => const BookingDetailView(),
      binding: BookingDetailBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_DETAIL_SUPPLIER,
      page: () => const BookingDetailSupplierView(),
      binding: BookingDetailSupplierBinding(),
    ),
  ];
}
