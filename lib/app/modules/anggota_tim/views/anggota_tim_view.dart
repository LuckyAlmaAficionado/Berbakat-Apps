import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talenta_app/app/shared/theme.dart';

import '../controllers/anggota_tim_controller.dart';

class AnggotaTimView extends GetView<AnggotaTimController> {
  const AnggotaTimView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Anggota Tim',
          style: appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: darkBlueColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: darkGreyColor,
            ),
            title: Text(
              "Nama Anggota TIM",
              style: blackTextStyle,
            ),
            subtitle: Text(
              "Jabatan Kantor",
              style: darkGreyTextStyle,
            ),
          );
        },
      ),
    );
  }
}
