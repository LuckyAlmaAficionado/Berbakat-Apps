import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talenta_app/app/shared/theme.dart';

import '../controllers/persetujuan_page_controller.dart';

class PersetujuanPageView extends GetView<PersetujuanPageController> {
  const PersetujuanPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlueColor,
        title: Obx(() => Text(
              controller.persetujuan.value,
              style: appBarTextStyle,
            )),
        centerTitle: true,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Cari...",
                  hintStyle: darkGreyTextStyle,
                  fillColor: whiteColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )),
      ),
      body: Center(
        child: Text(
          'Tidak ada data tersedia',
          style: blackTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
