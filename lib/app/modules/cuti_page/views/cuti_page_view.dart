// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:talenta_app/app/modules/cuti_page/views/delegasi_page_view.dart';
import 'package:talenta_app/app/modules/cuti_page/views/pengajuan_status_page_view.dart';
import 'package:talenta_app/app/shared/theme.dart';

import '../controllers/cuti_page_controller.dart';

class CutiPageView extends GetView<CutiPageController> {
  CutiPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cuti',
          style: whiteTextStyle.copyWith(
            fontWeight: regular,
            fontSize: 18,
          ),
        ),
        backgroundColor: darkBlueColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Material(
            elevation: 3,
            child: Container(
              width: Get.width,
              height: Get.height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: Get.height * 0.1,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: darkGreyColor),
                    ),
                    child: (false)
                        ? SizedBox()
                        : Center(
                            child: Text(
                              "Tidak ada data cuti",
                              style: blackTextStyle.copyWith(
                                fontWeight: regular,
                                fontSize: 14,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    controller: controller.controller,
                    tabs: [
                      Tab(
                        child: Text(
                          "Pengajuan",
                          style: blackTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Delegasi",
                          style: blackTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: TabBarView(
              controller: controller.controller,
              children: [
                PengajuanStatusPageView(),
                DelegasiPageView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
