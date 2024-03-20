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
          title: Text(
            'Absen',
            style: whiteTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          backgroundColor: darkBlueColor,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(Get.height * 0.11),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${DateFormat("HH:MM").format(DateTime.now())}',
                  style: TextStyle(
                    fontSize: 30,
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: ListView(
            children: [
              Row(
                children: [
                  Text(
                    "Daftar absensi",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  new Spacer(),
                  Text(
                    "Lihat Log",
                    style: darkGreyTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: List.generate(3, (index) {
                  return ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${DateFormat("HH:MM").format(DateTime.now())}",
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${DateFormat("dd MMM").format(DateTime.now())}",
                          style: greenTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: extraLight,
                          ),
                        )
                      ],
                    ),
                    title: Text(
                      "Clock In",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  );
                }).toList(),
              )
            ],
          ),
        ));
  }
}
