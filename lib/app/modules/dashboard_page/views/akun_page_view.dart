import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talenta_app/app/modules/akun_services/info_saya/views/file_saya_view.dart';
import 'package:talenta_app/app/modules/akun_services/info_saya/views/info_payroll_view.dart';
import 'package:talenta_app/app/modules/akun_services/info_saya/views/peringatan_view.dart';
import 'package:talenta_app/app/modules/akun_services/pengaturan/views/pin_view.dart';
import 'package:talenta_app/app/modules/akun_services/pengaturan/views/ubah_kata_sandi_view.dart';

import 'package:talenta_app/app/shared/theme.dart';
import 'package:talenta_app/app/shared/utils.dart';

import '../../akun_services/info_saya/info_pekerjaan_view.dart';
import '../../akun_services/info_saya/info_personal_page_view.dart';

class AkunPageView extends StatelessWidget {
  const AkunPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 10),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lucky Alma Aficionado Rigel',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Programmer",
                      style: darkGreyTextStyle.copyWith(
                        fontWeight: extraLight,
                      ),
                    ),
                    Text(
                      "Andi Offset",
                      style: darkGreyTextStyle.copyWith(
                        fontWeight: extraLight,
                      ),
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Info Saya",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPersonalPageView(),
                  ),
                ),
                child: ListTIleInfo(
                  Icon(Icons.person_outline_outlined),
                  "Info personal",
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPekerjaanView(),
                  ),
                ),
                child: ListTIleInfo(
                  Icon(Icons.account_box_outlined),
                  "Info pekerjaan",
                ),
              ),
              ListTIleInfo(
                Icon(Icons.emergency_outlined),
                "Info kontak darurat",
              ),
              ListTIleInfo(
                Icon(Icons.groups_outlined),
                "Info keluarga",
              ),
              ListTIleInfo(
                Icon(Icons.school_outlined),
                "Pendidikan dan pengalaman",
              ),
              GestureDetector(
                onTap: () => Get.to(InfoPayrollView()),
                child: ListTIleInfo(
                  Icon(Icons.account_balance_wallet_outlined),
                  "Info payroll",
                ),
              ),
              ListTIleInfo(
                Icon(Icons.info_outline),
                "Info tambahan",
              ),
              GestureDetector(
                onTap: () => Get.to(FileSayaView()),
                child: ListTIleInfo(
                  Icon(Icons.folder_copy_outlined),
                  "File saya",
                ),
              ),
              GestureDetector(
                onTap: () => Get.to(
                  PeringatanView(),
                  transition: Transition.downToUp,
                ),
                child: ListTIleInfo(
                  Icon(Icons.warning_amber_rounded),
                  "Peringatan",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Pengaturan",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UbahKataSandiView(),
                  ),
                ),
                child: ListTIleInfo(
                  Icon(Icons.lock_open_outlined),
                  "Ubah kata sandi",
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PinView(),
                  ),
                ),
                child: ListTIleInfo(
                  Icon(Icons.password_rounded),
                  "PIN",
                ),
              ),
              ListTIleInfo(
                Icon(Icons.tag_faces_sharp),
                "Aktifkan otentikasi",
              ),
              ListTIleInfo(
                Icon(Icons.access_time),
                "Pengingat clock in/out",
              ),
              ListTIleInfo(
                Icon(Icons.language),
                "Bahasa",
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Bantuan",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTIleInfo(
                Icon(Icons.question_answer_outlined),
                "Pusat bantuan",
              ),
              ListTIleInfo(
                Icon(Icons.donut_small_outlined),
                "FAQ",
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: Get.width,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Lainnya",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20,
                  ),
                ),
              ),
              ListTIleInfo(
                Icon(Icons.gpp_good_outlined),
                "Keamanan & Privasi",
              ),
              GestureDetector(
                onTap: () => Utils().feedbackApps(context),
                child: ListTIleInfo(
                  Icon(Icons.feedback_outlined),
                  "Berikan feedback",
                ),
              ),
              GestureDetector(
                onTap: () => Utils().exitRequestDialog(),
                child: ListTIleInfo(
                  Icon(Icons.exit_to_app),
                  "Keluar",
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Versi 1.0.0 (00001)",
          textAlign: TextAlign.center,
          style: blueTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  ListTile ListTIleInfo(leading, title) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        style: GoogleFonts.outfit(
          fontWeight: light,
        ),
      ),
      trailing: Icon(Icons.navigate_next_outlined),
    );
  }
}
