import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:talenta_app/app/modules/akun_services/pengaturan/views/set_new_pin.dart';

import 'package:talenta_app/app/modules/dashboard_page/controllers/dashboard_page_controller.dart';
import 'package:talenta_app/app/routes/app_pages.dart';

import '../../../shared/theme.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final controller = Get.put(DashboardPageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              'Selamat ${controller.timeOfDay()},',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            Text(
              'Lucky Alma Aficionado Rigel',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Jangan lupa absen hari ini',
              style: blackTextStyle,
            ),

            // ... service absen
            Container(
              width: Get.width,
              height: 160,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: darkBlueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ... divisi / penempatan
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Office 2',
                        style: whiteTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          color: whiteColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${DateFormat("dd MMMM yyyy (08:00 - 16:45)", "id_ID").format(DateTime.now())}",
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    //  INFO: CLOCK IN
                    Container(
                      width: Get.width,
                      height: constraints.maxHeight * 0.40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.CLOCK_IN_PAGE,
                                    arguments: "clock-in",
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_sign_in.png',
                                        height: 30,
                                        width: 30,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Clock In',
                                        style: blackTextStyle.copyWith(
                                          fontWeight: semiBold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 0.5,
                              height: constraints.maxHeight,
                              color: darkGreyColor,
                            ),
                            // INFO: CLOCK OUT
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.CLOCK_IN_PAGE,
                                    arguments: "clock-out",
                                  );
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/ic_sign_out.png',
                                        height: 33,
                                        width: 33,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Clock Out',
                                        style: blackTextStyle.copyWith(
                                          fontWeight: semiBold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // ... services feature
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.DAFTAR_ABSENSI_PAGE),
                        child: IconWidgetService(
                          Icons.calendar_month,
                          "Daftar Absensi",
                          HexColor("FA7113"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.ABSEN_PAGE),
                        child: IconWidgetService(
                          Icons.location_on_sharp,
                          "Absen",
                          HexColor("FC9E13"),
                        ),
                      ),
                      IconWidgetService(
                        Icons.calendar_month,
                        "Kalender",
                        HexColor("3883F7"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.CUTI_PAGE),
                        child: IconWidgetService(
                          Icons.access_time_filled_sharp,
                          "Cuti",
                          HexColor("3883F7"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(SetNewPinView()),
                        child: IconWidgetService(
                          Icons.wallet,
                          "Slip Gaji",
                          HexColor("18B8A6"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.servicePengajuan(context),
                        child: IconWidgetService(
                          Icons.assignment,
                          "Pengajuan",
                          HexColor("7D4DFD"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ... pengumuman
            Container(
              width: Get.width,
              height: (false) ? Get.height * 0.4 : 68,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ... title
                  Row(
                    children: [
                      Text(
                        "Anggota Tim Anda",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Get.dialog(
                            Center(
                              child: Container(
                                width: Get.width * 0.7,
                                height: Get.width * 0.7,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.groups,
                                      size: 100,
                                    ),
                                    DefaultTextStyle(
                                      style: blackTextStyle.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 18,
                                      ),
                                      child: Text(
                                        "Tim Anda akan Muncul",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    DefaultTextStyle(
                                      style: blackTextStyle.copyWith(
                                        fontWeight: regular,
                                        fontSize: 14,
                                      ),
                                      child: const Text(
                                        "Fitur ini akan menampilkan anggota tim yang anda pimpin. Pastikan untuk memverifikasi keanggotaan sebelum melanjutkan",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.info_outline,
                          size: 15,
                        ),
                      ),
                      new Spacer(),
                      Text(
                        "Lihat Semua",
                        style: lightBlueTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ... pengumuman
            Container(
              width: Get.width,
              height: Get.height * 0.4,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ... title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pengumuman",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Lihat Semua",
                        style: lightBlueTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: Get.width,
                          height: Get.height * 0.12,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://t3.ftcdn.net/jpg/03/15/34/90/360_F_315349043_6ohfFyx37AFusCKZtGQtJR0jqUxhb25Y.jpg"),
                              fit: BoxFit.fill,
                              opacity: 0.2,
                            ),
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Idul Adha',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${DateFormat("dd MMMM yyyy", "id_ID").format(DateTime.now())}',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: regular,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Container IconWidgetService(IconData icons, String title, Color colors) {
  return Container(
    width: 80,
    height: 90,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 40,
          color: colors,
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 11,
          ),
        ),
      ],
    ),
  );
}
