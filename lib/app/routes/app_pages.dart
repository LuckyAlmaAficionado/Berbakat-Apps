import 'package:get/get.dart';

import '../modules/absen_page/bindings/absen_page_binding.dart';
import '../modules/absen_page/views/absen_page_view.dart';
import '../modules/camera_page/bindings/camera_page_binding.dart';
import '../modules/camera_page/views/camera_page_view.dart';
import '../modules/clock_in_page/bindings/clock_in_page_binding.dart';
import '../modules/clock_in_page/views/clock_in_page_view.dart';
import '../modules/cuti_page/bindings/cuti_page_binding.dart';
import '../modules/cuti_page/views/cuti_page_view.dart';
import '../modules/daftar_absensi_page/bindings/daftar_absensi_page_binding.dart';
import '../modules/daftar_absensi_page/views/daftar_absensi_page_view.dart';
import '../modules/dashboard_page/bindings/dashboard_page_binding.dart';
import '../modules/dashboard_page/views/dashboard_page_view.dart';
import '../modules/sign_in_page/bindings/sign_in_page_binding.dart';
import '../modules/sign_in_page/views/sign_in_page_view.dart';
import '../modules/slider_page/bindings/slider_page_binding.dart';
import '../modules/slider_page/views/slider_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SLIDER_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.SLIDER_PAGE,
      page: () => const SliderPageView(),
      binding: SliderPageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_PAGE,
      page: () => const SignInPageView(),
      binding: SignInPageBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_PAGE,
      page: () => DashboardPageView(),
      binding: DashboardPageBinding(),
    ),
    GetPage(
      name: _Paths.CLOCK_IN_PAGE,
      page: () => ClockInPageView(),
      binding: ClockInPageBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_PAGE,
      page: () => const CameraPageView(),
      binding: CameraPageBinding(),
    ),
    GetPage(
      name: _Paths.ABSEN_PAGE,
      page: () => const AbsenPageView(),
      binding: AbsenPageBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_ABSENSI_PAGE,
      page: () => DaftarAbsensiPageView(),
      binding: DaftarAbsensiPageBinding(),
    ),
    GetPage(
      name: _Paths.CUTI_PAGE,
      page: () => CutiPageView(),
      binding: CutiPageBinding(),
    ),
  ];
}
