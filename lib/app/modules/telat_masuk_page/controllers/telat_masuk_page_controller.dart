import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class TelatMasukPageController extends GetxController {
  RxString timePicker = "".obs;
  RxInt rentangWaktu = 0.obs;

  int calculateLateMinutes(String inputTime) {
    // Mendapatkan waktu istirahat (12:45) dalam bentuk TimeOfDay
    final TimeOfDay restTime = TimeOfDay(hour: 12, minute: 45);

    // Mendapatkan waktu terlambat dari input
    final List<String> parts = inputTime.split(":");
    final int hours = int.parse(parts[0]);
    final int minutes = int.parse(parts[1]);
    final TimeOfDay lateTime = TimeOfDay(hour: hours, minute: minutes);

    // Menghitung selisih waktu dalam menit
    int lateMinutes = lateTime.hour * 60 +
        lateTime.minute -
        (restTime.hour * 60 + restTime.minute);

    // Jika terlambat, pastikan nilai menit tidak kurang dari 0
    if (lateMinutes < 0) {
      lateMinutes = 0;
    }

    return lateMinutes;
  }
}
