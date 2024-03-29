import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talenta_app/app/controllers/camera_data_controller.dart';

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
  String pathFile = "";

  String pickDate = "";
  String opsiData = "Pilih data";
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
  void dispose() {
    pathFile = "";
    super.dispose();
  }

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

            (opsiData.contains("Gambar"))
                ? Column(
                    children: [
                      Divider(
                        thickness: 1,
                        color: darkGreyColor,
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.edit_outlined,
                            color: darkGreyColor,
                          ),
                          CircleAvatar(
                            radius: 25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                  "https://media-cgk1-2.cdn.whatsapp.net/v/t61.24694-24/297865369_1076922602934423_3062814798227697508_n.jpg?ccb=11-4&oh=01_AdRJwzOKAPikzESrMMzRrOMh8wq5vbpzv8YZuqxqYr7f5w&oe=660F41B3&_nc_sid=e6ed6c&_nc_cat=111"),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios_outlined),
                          GestureDetector(
                            onTap: () async {
                              await PickImageOption(context);
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              child: (pathFile == "")
                                  ? CircleAvatar(
                                      backgroundColor: darkGreyColor,
                                      child: Icon(
                                        Icons.upload,
                                        color: whiteColor,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(
                                        File(pathFile),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      const Gap(10),
                    ],
                  )
                : Column(
                    children: [
                      Divider(
                        thickness: 1,
                        color: darkGreyColor,
                      ),
                      CustomTextfield(
                        hint: "Ubah Menjadi",
                        prefix: Icons.edit_outlined,
                      ),
                    ],
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
            (opsiData.contains("Gambar"))
                ? SizedBox()
                : Column(
                    children: [
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
                    ],
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

  Future<dynamic> PickImageOption(BuildContext context) {
    final imageC = Get.put(CameraDataController());

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 190,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: darkGreyColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const Gap(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      XFile? file = await imageC.pickImage(ImageSource.camera);
                      setState(() {
                        pathFile = file.path;
                      });
                      Get.back();
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: darkGreyColor,
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: whiteColor,
                            size: 30,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "Kamera",
                          style: blackTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      XFile? file = await imageC.pickImage(ImageSource.gallery);
                      setState(() {
                        pathFile = file.path;
                      });
                      Get.back();
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: darkGreyColor,
                          ),
                          child: Icon(
                            Icons.image,
                            color: whiteColor,
                            size: 30,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          "Galeri",
                          style: blackTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
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

  showDialogOpsi(BuildContext context) async {
    TextEditingController searchC = TextEditingController();
    List<String> sort = [];
    return await showModalBottomSheet(
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
              // ... jenis cuti
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                    (sort.isEmpty) ? opsiPerubahanData.length : sort.length,
                    (index) => ListTile(
                      onTap: () {
                        opsiData = opsiPerubahanData[index];
                        Get.back();
                      },
                      title: Text(
                        (sort.isEmpty) ? opsiPerubahanData[index] : sort[index],
                        style: darkGreyTextStyle.copyWith(
                          fontWeight: regular,
                          fontSize: 16,
                        ),
                      ),
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
