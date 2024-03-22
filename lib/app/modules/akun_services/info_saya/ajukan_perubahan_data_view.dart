import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:talenta_app/app/modules/cuti_page/controllers/cuti_page_controller.dart';
import 'package:talenta_app/app/shared/theme.dart';
import 'package:talenta_app/app/shared/utils.dart';

class AjukanPerubahanDataView extends StatefulWidget {
  const AjukanPerubahanDataView({super.key});

  @override
  State<AjukanPerubahanDataView> createState() => _PengajuanCutiViewState();
}

class _PengajuanCutiViewState extends State<AjukanPerubahanDataView> {
  final cutiC = Get.put(CutiPageController());

  String pickDate = "";
  String opsiData = "Pilih data";
  RxString opsiPerubahanController = "".obs;
  List<String> opsiPerubahanData = [
    "Nama depan",
    "Nama Belakang",
    "Email",
    "Tipe ID",
    "Nomor ID",
    "Tanggal kadaluarsa",
    "Kode Pos",
    "Alamat Sesuai Identitas",
    "Tempat Lahir",
    "Tanggal Lahir",
    "Handphone",
    "Telepon",
    "Jenis Kelamin",
    "Status Pernikahan",
    "Golongan Darah",
    "Agama",
    "BPJS Ketenagakerjaan",
    "BPJS Kesehatan",
    "BPJS Keluarga",
    "NPWP",
    "Nama Bank",
    "No Rekening Bank",
    "Nama Pemilik Rekening",
    "Gambar Profil",
    "Alamat Tempat Tinggal",
    "Status PTKP"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkBlueColor,
        title: Text(
          "Ajukan perubahan data",
          style: appBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                await showDialogOpsi(context);
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.work_outline_outlined,
                      color: darkGreyColor,
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: Get.width * 0.6,
                      child: Text(
                        opsiData,
                        maxLines: 2,
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    new Spacer(),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: darkGreyColor,
                    ),
                  ],
                ),
              ),
            ),

            Divider(
              thickness: 1,
              color: darkGreyColor,
            ),
            CustomTextfield(
              hint: "Ubah Menjadi",
              prefix: Icons.edit_outlined,
            ),

            //....
            Divider(
              thickness: 1,
              color: darkGreyColor,
            ),
            CustomTextfield(
              hint: "Deskripsi",
              prefix: Icons.format_align_left,
            ),
            // ..
            Divider(
              thickness: 1,
              color: darkGreyColor,
            ),
            GestureDetector(
              onTap: () {
                cutiC.openFileExplorer();
              },
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.file_copy_outlined,
                      color: darkGreyColor,
                    ),
                    const SizedBox(width: 10),
                    Obx(
                      () => SizedBox(
                        width: Get.width * 0.7,
                        child: Text(
                          (cutiC.filePath.isNotEmpty)
                              ? cutiC.filePath.value.split("/").last
                              : "Unggah file",
                          maxLines: 2,
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "ukuran maksimal file 10 MB",
              style: darkGreyTextStyle,
            ),
            Divider(
              thickness: 1,
              color: darkGreyColor,
            ),
            const SizedBox(height: 50),
            CustomButton(
              title: "Ajukan",
              onTap: () {},
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Keluar",
                    middleText: "Anda akan membatalkan perubahan data?",
                    onConfirm: () {
                      Get.back();
                      Get.back();
                    },
                    onCancel: () {},
                    confirmTextColor: whiteColor,
                    cancelTextColor: blackColor,
                    titleStyle: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                    middleTextStyle: blackTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                  );
                },
                child: Text(
                  "Batal",
                  style: darkGreyTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  dilegasi() async => await showModalBottomSheet(
        context: context,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) => Container(
          height: Get.height * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.close,
                      color: darkGreyColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Dilegasi Ke",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),

              // ... textfield
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    hintText: "Cari...",
                    hintStyle: darkGreyTextStyle.copyWith(
                      fontWeight: extraLight,
                    ),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: darkGreyColor,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              // ... jenis cuti
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                    cutiC.tipeCuti.length,
                    (index) => ListTile(
                      onTap: () {
                        opsiData = cutiC.tipeCuti[index];
                        Get.back();
                      },
                      title: Text("293 - Lucky Alma Aficionado Rigel"),
                      subtitle: Text("Programmer"),
                      leading: CircleAvatar(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  datePickter() async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );

    if (picker != null) {
      setState(() {
        pickDate = picker.toIso8601String();
      });
    }
  }

  showDialogOpsi(BuildContext context) async => await showModalBottomSheet(
        context: context,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            height: Get.height * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close,
                        color: darkGreyColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Tipe cuti",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // ... textfield
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      hintText: "Cari...",
                      hintStyle: darkGreyTextStyle.copyWith(
                        fontWeight: extraLight,
                      ),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // ... jenis cuti
                Expanded(
                  child: ListView(
                    children: List.generate(
                      opsiPerubahanData.length,
                      (index) => ListTile(
                        onTap: () {
                          opsiData = opsiPerubahanData[index];
                          Get.back();
                        },
                        title: Text(opsiPerubahanData[index]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
}

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    this.controller,
    required this.hint,
    required this.prefix,
    this.suffix,
  });

  TextEditingController? controller;
  final String hint;
  final IconData prefix;
  IconData? suffix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: blackTextStyle.copyWith(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: darkGreyTextStyle,
        prefixIcon: Icon(
          prefix,
          color: darkGreyColor,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(
          suffix,
          color: darkGreyColor,
        ),
      ),
    );
  }
}
