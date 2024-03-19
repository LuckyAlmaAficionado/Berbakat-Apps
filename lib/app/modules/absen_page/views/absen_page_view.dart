import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talenta_app/app/shared/theme.dart';

import '../controllers/absen_page_controller.dart';

class AbsenPageView extends GetView<AbsenPageController> {
  const AbsenPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absen'),
        centerTitle: true,
        backgroundColor: blueColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Get.height * 0.11),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${DateFormat("HH:MM").format(DateTime.now())}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: semiBold,
                  color: whiteColor,
                ),
              ),
              Text(
                '${DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(DateTime.now())}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: semiBold,
                  color: whiteColor,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'AbsenPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
