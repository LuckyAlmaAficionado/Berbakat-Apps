import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:talenta_app/app/modules/akun_services/info_saya/ajukan_perubahan_data_view.dart';

import '../../../../shared/theme.dart';
import '../info_personal_page_view.dart';

class InfoPayrollView extends GetView {
  const InfoPayrollView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: darkGreyColor,
              )),
          actions: [
            TextButton(
              onPressed: () {
                print("ajikan perubahan data");
                Get.to(AjukanPerubahanDataView(), transition: Transition.zoom);
              },
              child: Text("Ajukan perubahan data"),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          children: [
            Text(
              'Info Personal',
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
            ),
            const SizedBox(height: 20),
            InfoPersonalTile(
              title: "BPJS Ketenagakerjaan",
              subTitle: "-",
            ),
            InfoPersonalTile(
              title: "BPJS Kesehatan",
              subTitle: "-",
            ),
            InfoPersonalTile(
              title: "Nama Bank",
              subTitle: "Other",
            ),
            InfoPersonalTile(
              title: "No Rekening Bank",
              subTitle: "Other",
            ),
            InfoPersonalTile(
              title: "Nama Pemilik Rekening",
              subTitle: "-",
            ),
            InfoPersonalTile(
              title: "Status PTKP",
              subTitle: "TK/0",
            ),
          ],
        ));
  }
}
