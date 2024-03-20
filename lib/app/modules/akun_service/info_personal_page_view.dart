import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talenta_app/app/shared/theme.dart';

class InfoPersonalPageView extends GetView {
  const InfoPersonalPageView({Key? key}) : super(key: key);
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
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Ajukan perubahan data",
                style: blueTextStyle,
              ),
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
              title: "Nama Depan",
              subTitle: "Lucky Alma Aficionado",
            ),
            InfoPersonalTile(
              title: "Nama Belakang",
              subTitle: "Rigel",
            ),
            InfoPersonalTile(
              title: "Email",
              subTitle: "luckyrigel9802@gmail.com",
            ),
            InfoPersonalTile(
              title: "Jenis Kelamin",
              subTitle: "Laki-laki",
            ),
            InfoPersonalTile(
              title: "Tempat Lahir",
              subTitle: "Semarang",
            ),
            InfoPersonalTile(
              title: "Tanggal Lahir",
              subTitle: "09 Agu 2002",
            ),
            InfoPersonalTile(
              title: "Handphone",
              subTitle: "087719857757",
            ),
            InfoPersonalTile(
              title: "Telpon",
              subTitle: "087719857757",
            ),
            InfoPersonalTile(
              title: "Status Pernikahan",
              subTitle: "Belum Menikah",
            ),
            InfoPersonalTile(
              title: "Agama",
              subTitle: "Islam",
            ),
            InfoPersonalTile(
              title: "Nomor ID",
              subTitle: "6371050908020014",
            ),
            InfoPersonalTile(
              title: "Tipe ID",
              subTitle: "KTP",
            ),
            InfoPersonalTile(
              title: "Tipe ID",
              subTitle: "KTP",
            ),
            InfoPersonalTile(
              title: "Tanggal Kadarluasa",
              subTitle: "Permanen",
            ),
            InfoPersonalTile(
              title: "Alamat Sesuai Identitas",
              subTitle:
                  "Jl, Mandi Angin No. 11 Komp. Mulawarman RT.32 RW.03, Teluk Dalam, Banjarmasin Tengah, Banjarmasin, Kalimantan Selatan",
            ),
            InfoPersonalTile(
              title: "Kode Pos",
              subTitle: "-",
            ),
            InfoPersonalTile(
              title: "Alamat Tempat Tinggal",
              subTitle:
                  "Jl, Mandi Angin No. 11 Komp. Mulawarman RT.32 RW.03, Teluk Dalam, Banjarmasin Tengah, Banjarmasin, Kalimantan Selatan",
            ),
            InfoPersonalTile(
              title: "Golongan Darah",
              subTitle: "-",
            ),
          ],
        ));
  }
}

class InfoPersonalTile extends StatelessWidget {
  const InfoPersonalTile({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: darkGreyTextStyle.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 5),
        Text(
          subTitle,
          style: blackTextStyle.copyWith(fontSize: 16),
        ),
        Divider(
          thickness: 1,
          color: darkGreyColor,
        ),
      ],
    );
  }
}
