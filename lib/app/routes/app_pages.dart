import 'package:get/get.dart';

import '../modules/absen_page/bindings/absen_page_binding.dart';
import '../modules/absen_page/views/absen_page_view.dart';
import '../modules/anggota_tim/bindings/anggota_tim_binding.dart';
import '../modules/anggota_tim/views/anggota_tim_view.dart';
import '../modules/camera_page/bindings/camera_page_binding.dart';
import '../modules/camera_page/views/camera_page_view.dart';
import '../modules/clock_in_page/bindings/clock_in_page_binding.dart';
import '../modules/clock_in_page/views/clock_in_page_view.dart';
import '../modules/cuti_page/bindings/cuti_page_binding.dart';
import '../modules/cuti_page/views/cuti_page_view.dart';
import '../modules/daftar_absensi_page/bindings/daftar_absensi_page_binding.dart';
import '../modules/daftar_absensi_page/views/daftar_absensi_page_view.dart';
import '../modules/daftar_absensi_page/views/pengajuan_absensi_view.dart';
import '../modules/dashboard_page/bindings/dashboard_page_binding.dart';
import '../modules/dashboard_page/views/dashboard_page_view.dart';
import '../modules/persetujuan_page/bindings/persetujuan_page_binding.dart';
import '../modules/persetujuan_page/views/persetujuan_page_view.dart';
import '../modules/reimbursement_page/bindings/reimbursement_page_binding.dart';
import '../modules/reimbursement_page/views/reimbursement_page_view.dart';
import '../modules/sign_in_page/bindings/sign_in_page_binding.dart';
import '../modules/sign_in_page/views/sign_in_page_view.dart';
import '../modules/slider_page/bindings/slider_page_binding.dart';
import '../modules/slider_page/views/slider_page_view.dart';
import '../modules/slip_gaji_page/bindings/slip_gaji_page_binding.dart';
import '../modules/slip_gaji_page/views/slip_gaji_page_view.dart';
import '../modules/telat_masuk_page/bindings/telat_masuk_page_binding.dart';
import '../modules/telat_masuk_page/views/telat_masuk_page_view.dart';
import '../modules/validator_pin/bindings/validator_pin_binding.dart';
import '../modules/validator_pin/views/validator_pin_view.dart';
import '../shared/detail_info_absensi_view.dart';
import '../shared/splash.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SLIDER_PAGE;
  // static const INITIAL = "/splash-page";

  static final routes = [
    GetPage(
      name: '/pengajuan-absensi',
      page: () => PengajuanAbsensiView(),
    ),
    GetPage(
      name: "/splash-page",
      page: () => SplashPageView(),
    ),
    GetPage(
      name: "/detail-info-absensi-view",
      page: () => DetailInfoAbsensiView(),
    ),
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
      page: () => CameraPageView(),
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
    GetPage(
      name: _Paths.VALIDATOR_PIN,
      page: () => ValidatorPinView(),
      binding: ValidatorPinBinding(),
    ),
    GetPage(
      name: _Paths.SLIP_GAJI_PAGE,
      page: () => const SlipGajiPageView(),
      binding: SlipGajiPageBinding(),
    ),
    GetPage(
      name: _Paths.PERSETUJUAN_PAGE,
      page: () => const PersetujuanPageView(),
      binding: PersetujuanPageBinding(),
    ),
    GetPage(
      name: _Paths.TELAT_MASUK_PAGE,
      page: () => const TelatMasukPageView(),
      binding: TelatMasukPageBinding(),
    ),
    GetPage(
      name: _Paths.REIMBURSEMENT_PAGE,
      page: () => const ReimbursementPageView(),
      binding: ReimbursementPageBinding(),
    ),
    GetPage(
      name: _Paths.ANGGOTA_TIM,
      page: () => const AnggotaTimView(),
      binding: AnggotaTimBinding(),
    ),
  ];
}
