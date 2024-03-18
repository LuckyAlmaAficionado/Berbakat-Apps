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
      body: ListView(
        children: [
          Text('Selamat siang,'),
          Text('Lucky Alma Aficionado Rigel'),
          Text('Jangan lupa absen hari ini'),

          // ... service absen
          Container(
            width: Get.width,
            height: Get.height * 0.15,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: lightBlueColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          // ... services feature
          Container(
            width: Get.width,
            height: Get.height * 0.25,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
