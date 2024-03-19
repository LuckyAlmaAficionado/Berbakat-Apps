import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'package:talenta_app/app/shared/theme.dart';

class RiwayatPageView extends StatefulWidget {
  const RiwayatPageView({super.key});

  @override
  State<RiwayatPageView> createState() => _RiwayatPageViewState();
}

class _RiwayatPageViewState extends State<RiwayatPageView> {
  DateTime selectedDate = DateTime.now();

  final DateTime today = DateTime.now();

  DateTime startDate =
      DateTime(DateTime.now().year, DateTime.now().month - 1, 26);
  @override
  Widget build(BuildContext context) {
    // ... hitung tanggal berakhir
    DateTime endDate;
    if (today.month == 12) {
      endDate = DateTime(today.year + 1, 1, 26);
    } else {
      endDate = DateTime(today.year, today.month + 1, 26);
    }

    // ... hitung panjang rentang tanggal
    final Duration dateRange = endDate.difference(startDate);
    final int dateLenght = dateRange.inDays;
    return ListView(
      children: [
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final dateTime = await showMonthYearPicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(3000),
              initialMonthYearPickerMode: MonthYearPickerMode.month,
            );

            if (dateTime != null) {
              setState(() {
                startDate = dateTime;
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
                  "${DateFormat("MMMM yyyy", "id_ID").format(
                    DateTime(startDate.year, startDate.month + 1),
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
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          height: 150,
          decoration: BoxDecoration(
            color: lightGreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTileInfo(
                    title: "Absen",
                    value: 0,
                  ),
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
            dateLenght,
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
                                  startDate.add(
                                    Duration(days: index),
                                  ),
                                ),
                                style: (startDate
                                                .add(Duration(days: index))
                                                .weekday ==
                                            DateTime.saturday ||
                                        startDate
                                                .add(Duration(days: index))
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
