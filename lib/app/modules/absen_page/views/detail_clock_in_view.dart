import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:talenta_app/app/shared/theme.dart';

class DetailClockInView extends GetView {
  const DetailClockInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlueColor,
          title: Text(
            'Detail Clock In',
            style: appBarTextStyle,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 200,
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(color: blueColor),
                  )),
                  Expanded(
                    child: Container(
                      width: Get.width,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                            ),
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(style: darkGreyTextStyle, "Waktu clock in"),
                    subtitle:
                        Text(style: blackTextStyle, "07:44 (27 Mar 2024)"),
                  ),
                  Divider(
                    thickness: 1,
                    color: darkGreyColor,
                  ),
                  ListTile(
                    title: Text(style: darkGreyTextStyle, "Shift"),
                    subtitle:
                        Text(style: blackTextStyle, "Office2 (08:00 - 16:45)"),
                  ),
                  Divider(
                    thickness: 1,
                    color: darkGreyColor,
                  ),
                  ListTile(
                    title: Text(style: darkGreyTextStyle, "Jadwal Shift"),
                    subtitle: Text(style: blackTextStyle, "Rab, 27 Mar 2024"),
                  ),
                  Divider(
                    thickness: 1,
                    color: darkGreyColor,
                  ),
                  ListTile(
                    title: Text(style: darkGreyTextStyle, "Lokasi"),
                    subtitle: Text(
                        style: blackTextStyle,
                        "Otc Daihen Indonesia PT. Jalan Demanggan Baru, Catur Tunggal Kel, Depok, Sleman, 55598, Indonesia"),
                  ),
                  Divider(
                    thickness: 1,
                    color: darkGreyColor,
                  ),
                  ListTile(
                    title: Text(style: darkGreyTextStyle, "Koordinat"),
                    subtitle:
                        Text(style: blackTextStyle, "-70080405,110.023048034"),
                  ),
                  Divider(
                    thickness: 1,
                    color: darkGreyColor,
                  ),
                  ListTile(
                    title: Text(style: darkGreyTextStyle, "Catatan"),
                    subtitle: Text(style: blackTextStyle, "-"),
                  ),
                  Divider(
                    thickness: 1,
                    color: darkGreyColor,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
