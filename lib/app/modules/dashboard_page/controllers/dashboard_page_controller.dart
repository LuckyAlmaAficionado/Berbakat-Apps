import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:talenta_app/app/controllers/authentication_controller.dart';
import 'package:talenta_app/app/modules/akun_services/info_saya/views/perubahan_shift_view.dart';
import 'package:talenta_app/app/routes/app_pages.dart';
import 'package:talenta_app/app/shared/theme.dart';

class DashboardPageController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isShowAlert = true.obs;

  AuthenticationController authC = Get.find<AuthenticationController>();

  @override
  void onInit() {
    super.onInit();

    // ...
  }

  // ...
  String timeOfDay() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.Hm().format(now);

    // mendapatkan waktu dari jam yang di format
    int hour = int.parse(formattedTime.split(":").first);

    // Menggunakan logika sederhana untuk menentukan apakah itu pagi, siang, atau malam
    String timeOfDay;
    if (hour >= 5 && hour < 12) {
      timeOfDay = 'Pagi';
    } else if (hour >= 12 && hour < 18) {
      timeOfDay = 'Siang';
    } else {
      timeOfDay = 'Malam';
    }

    // Mengembalikan hasil
    return timeOfDay;
  }

  // ...

  void servicePengajuan(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) => Container(
        height: 320,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ajukan untuk",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.close,
                      color: darkGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.REIMBURSEMENT_PAGE),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.task_outlined,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Reimbursement",
                            style: GoogleFonts.outfit(fontSize: 16),
                          ),
                          new Spacer(),
                          Icon(Icons.keyboard_arrow_right_rounded),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.CUTI_PAGE),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Cuti",
                            style: GoogleFonts.outfit(fontSize: 16),
                          ),
                          new Spacer(),
                          Icon(Icons.keyboard_arrow_right_rounded),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.ABSEN_PAGE),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_history_outlined,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Absensi",
                            style: GoogleFonts.outfit(
                              fontSize: 16,
                            ),
                          ),
                          new Spacer(),
                          Icon(Icons.keyboard_arrow_right_rounded),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Get.to(
                      PerubahanShiftView(),
                      transition: Transition.cupertino,
                    ),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Icon(
                            Icons.work_outline_outlined,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Perubahan Shift",
                            style: GoogleFonts.outfit(fontSize: 16),
                          ),
                          new Spacer(),
                          Icon(Icons.keyboard_arrow_right_rounded),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
