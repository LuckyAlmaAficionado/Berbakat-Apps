import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:talenta_app/app/modules/dashboard_page/controllers/dashboard_page_controller.dart';
import 'package:talenta_app/app/modules/dashboard_page/views/detail_inbox_view.dart';
import 'package:talenta_app/app/shared/theme.dart';

class InboxPageView extends StatefulWidget {
  const InboxPageView({super.key});

  @override
  State<InboxPageView> createState() => _InboxPageViewState();
}

class _InboxPageViewState extends State<InboxPageView>
    with TickerProviderStateMixin {
  final dashC = Get.put(DashboardPageController());
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Column(
        children: [
          // ... appbar view
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: lightGreyColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SafeArea(
                  child: Text(
                    "Inbox",
                    style: blackTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TabBar(
                  controller: tabController,
                  labelColor: blueColor,
                  labelStyle: GoogleFonts.outfit(fontSize: 15),
                  unselectedLabelColor: darkGreyColor,
                  tabs: [
                    Tab(
                      child: Text(
                        'Notifikasi',
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Butuh Persetujuan',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                NotificationTabBar(dashC: dashC),
                PersetujuanTabBar(dashC: dashC)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersetujuanTabBar extends StatelessWidget {
  const PersetujuanTabBar({
    super.key,
    required this.dashC,
  });

  final DashboardPageController dashC;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        customTile(
          () {},
          Icon(
            Icons.developer_board,
            color: HexColor("15B6A7"),
          ),
          "Reimbursement",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
        customTile(
          () {},
          Icon(
            Icons.access_time_filled_sharp,
            color: HexColor("3A84F3"),
          ),
          "Cuti",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
        customTile(
          () {},
          Icon(
            Icons.location_on_sharp,
            color: HexColor("F59E0C"),
          ),
          "Absensi",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
        customTile(
          () {},
          Icon(
            Icons.more_time_sharp,
            color: HexColor("FB7316"),
          ),
          "Lembur",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
        customTile(
          () {},
          Icon(
            Icons.business_center_rounded,
            color: HexColor("EE4443"),
          ),
          "Perubahan shift",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
        customTile(
          () {},
          Icon(
            Icons.account_box_sharp,
            color: HexColor("8B5DFB"),
          ),
          "Perubahan data",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
        customTile(
          () {},
          Icon(
            Icons.format_align_left_outlined,
            color: HexColor("8D5BF8"),
          ),
          "Formulir",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
        customTile(
          () {},
          Icon(
            Icons.person,
            color: HexColor("F8BF28"),
          ),
          "Penambahan karyawan",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
        customTile(
          () {},
          Icon(
            Icons.folder_shared_sharp,
            color: HexColor("F69F05"),
          ),
          "Pemindahan karyawan",
          Icon(
            Icons.navigate_next_outlined,
          ),
        ),
      ],
    );
  }

  Widget customTile(Function()? onTap, leading, title, trailing) => ListTile(
        onTap: onTap,
        leading: leading,
        title: Text(
          title,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w300,
          ),
        ),
        trailing: trailing,
      );
}

class NotificationTabBar extends StatelessWidget {
  const NotificationTabBar({
    super.key,
    required this.dashC,
  });

  final DashboardPageController dashC;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 15),
      children: [
        Obx(
          () => AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.bounceOut,
            height: (dashC.isShowAlert.value) ? Get.height * 0.22 : 0,
            width: (dashC.isShowAlert.value) ? Get.width : 0,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              color: HexColor("EAECFB"),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              padding: EdgeInsets.only(top: 15),
              physics: NeverScrollableScrollPhysics(),
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: HexColor("015FBF"),
                      size: 30,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Ketersediaan data',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Anda hanya dapat mengakses data dari 2 tahun terakhir. Untuk mengakses data yang lebih lama silahkan hubungi kami melalui email',
                  style: blackTextStyle.copyWith(
                    fontWeight: extraLight,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Hubungi Kami",
                        style: blueTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => dashC.isShowAlert.toggle(),
                      child: Text(
                        "Oke, mengerti",
                        style: blueTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ...List.generate(3, (index) {
          return ListTile(
            onTap: () => Get.to(
              DetailInboxView(),
              transition: Transition.downToUp,
            ),
            minVerticalPadding: 10,
            trailing: Icon(Icons.navigate_next_sharp),
            leading: CircleAvatar(
              backgroundColor: darkGreyColor,
            ),
            title: Text(
              "Maria Setiawati Purbanigtyas",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            subtitle: Text("Your requested change data has been accepted"),
          );
        })
      ],
    );
  }
}
