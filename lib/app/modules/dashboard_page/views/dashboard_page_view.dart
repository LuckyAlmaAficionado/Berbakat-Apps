import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:talenta_app/app/shared/theme.dart';

import '../controllers/dashboard_page_controller.dart';

class DashboardPageView extends GetView<DashboardPageController> {
  const DashboardPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyColor,
      body: Obx(() => controller.listWidget[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: blackColor,
            unselectedItemColor: darkGreyColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedLabelStyle: lightGreyTextStyle.copyWith(
              fontSize: 12,
            ),
            selectedLabelStyle: blackTextStyle.copyWith(
              fontSize: 12,
            ),
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_sharp),
                label: 'Pengajuan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox_outlined),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Akun',
              ),
            ],
          )),
    );
  }
}
