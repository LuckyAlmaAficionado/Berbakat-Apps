import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:talenta_app/app/modules/daftar_absensi_page/controllers/daftar_absensi_page_controller.dart';

import 'package:talenta_app/app/shared/theme.dart';

class RiwayatPageView extends StatefulWidget {
  const RiwayatPageView({super.key});

  @override
  State<RiwayatPageView> createState() => _RiwayatPageViewState();
}

class _RiwayatPageViewState extends State<RiwayatPageView> {
  final daftarC = Get.put(DaftarAbsensiPageController());

  @override
  Widget build(BuildContext context) {
    // ... hitung tanggal berakhir

    Get.find<DaftarAbsensiPageController>().setNewDate();

    // ... hitung panjang rentang tanggal

    return Column(
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final dateTime = await showMonthYearPicker(
              context: context,
              initialDate: daftarC.selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(3000),
              initialMonthYearPickerMode: MonthYearPickerMode.month,
            );

            if (dateTime != null) {
              setState(() {
                daftarC.selectedDate = dateTime;
              });
            }
          },
          child: Container(
            width: Get.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: darkGreyColor,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.date_range_outlined),
                const SizedBox(width: 10),
                Text(
                  "${DateFormat("MMM yyyy", "id_ID").format(
                    DateTime(
                        daftarC.startDate.year, daftarC.startDate.month + 1),
                  )}",
                  style: blackTextStyle,
                ),
                new Spacer(),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  color: darkGreyColor,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                height: 150,
                decoration: BoxDecoration(
                  color: blueColor.withAlpha(40),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => ListTileInfo(
                              title: "Absen",
                              value: daftarC.absent.value,
                            )),
                        ListTileInfo(
                          title: "No clock in",
                          value: 0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTileInfo(
                          title: "Late clock in",
                          value: 0,
                        ),
                        ListTileInfo(
                          title: "No clock out",
                          value: 0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTileInfo(
                          title: "Early clock out",
                          value: 0,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ...List.generate(
                  daftarC.dateOfMonthLength(),
                  (index) => Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat("dd MMM", "id_ID").format(
                                        daftarC.startDate.add(
                                          Duration(days: index),
                                        ),
                                      ),
                                      style: (daftarC.startDate
                                                      .add(
                                                          Duration(days: index))
                                                      .weekday ==
                                                  DateTime.saturday ||
                                              daftarC.startDate
                                                      .add(
                                                          Duration(days: index))
                                                      .weekday ==
                                                  DateTime.sunday)
                                          ? GoogleFonts.outfit(
                                              color: Colors.red,
                                              fontSize: 16,
                                            )
                                          : blackTextStyle.copyWith(
                                              fontSize: 16,
                                            ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Jam kerja',
                                      style: blackTextStyle.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Text("-"),
                                Text("-"),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: darkGreyColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Divider(
                              thickness: 1,
                              color: darkGreyColor,
                            ),
                          ],
                        ),
                      )),
            ],
          ),
        ),
      ],
    );
  }
}

class ListTileInfo extends StatelessWidget {
  const ListTileInfo({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        Text(
          value.toString(),
          style: blueTextStyle.copyWith(fontWeight: bold),
        ),
      ],
    );
  }
}
