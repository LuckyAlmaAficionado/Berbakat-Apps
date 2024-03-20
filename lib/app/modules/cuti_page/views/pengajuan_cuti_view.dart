import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talenta_app/app/modules/cuti_page/controllers/cuti_page_controller.dart';
import 'package:talenta_app/app/shared/theme.dart';

class PengajuanCutiView extends StatefulWidget {
  const PengajuanCutiView({super.key});

  @override
  State<PengajuanCutiView> createState() => _PengajuanCutiViewState();
}

class _PengajuanCutiViewState extends State<PengajuanCutiView> {
  final cutiC = Get.put(CutiPageController());

  String jenisCutiController = "Jenis Cuti";
  String pickDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: darkBlueColor,
        title: Text(
          "Pengajuan Cuti",
          style: whiteTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                await jenisCuti();
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
                        jenisCutiController,
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

            // ....
            Divider(
              thickness: 1,
              color: darkGreyColor,
            ),
            GestureDetector(
              onTap: () async => await datePickter(),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      color: darkGreyColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      (pickDate.isEmpty)
                          ? "Pilih tanggal"
                          : "${DateFormat("dd MMMM yyyy", "id_ID").format(DateTime.parse(pickDate))}",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //....
            Divider(
              thickness: 1,
              color: darkGreyColor,
            ),
            CustomTextfield(
              hint: "Alasan",
              prefix: Icons.format_align_left,
            ),

            // ....
            Divider(
              thickness: 1,
              color: darkGreyColor,
            ),
            GestureDetector(
              onTap: () {
                dilegasi();
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      color: darkGreyColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Delegasi ke (opsional)",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
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
                              : "Input file",
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
            SizedBox(
              height: 55,
              width: Get.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: darkBlueColor,
                ),
                onPressed: () {},
                child: Text(
                  "Kirim Pengajuan",
                  style: whiteTextStyle.copyWith(
                    fontWeight: regular,
                  ),
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
                        jenisCutiController = cutiC.tipeCuti[index];
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

  jenisCuti() async => await showModalBottomSheet(
        context: context,
        enableDrag: true,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            height: Get.height * 0.8,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      cutiC.tipeCuti.length,
                      (index) => ListTile(
                        onTap: () {
                          jenisCutiController = cutiC.tipeCuti[index];
                          Get.back();
                        },
                        title: Text(cutiC.tipeCuti[index]),
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
