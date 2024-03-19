import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talenta_app/app/modules/dashboard_page/views/akun_page_view.dart';
import 'package:talenta_app/app/modules/dashboard_page/views/home_page_view.dart';
import 'package:talenta_app/app/modules/dashboard_page/views/inbox_page_view.dart';

import 'package:talenta_app/app/shared/theme.dart';

import '../controllers/dashboard_page_controller.dart';

// ignore: must_be_immutable
class DashboardPageView extends GetView<DashboardPageController> {
  var listWidget = <Widget>[
    HomePageView(),
    InboxPageView(),
    AkunPageView(),
  ].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyColor,
      body: Obx(() => listWidget[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: blueColor,
            unselectedItemColor: darkGreyColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedLabelStyle: lightGreyTextStyle.copyWith(
              fontSize: 12,
            ),
            selectedLabelStyle: blueTextStyle.copyWith(
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
