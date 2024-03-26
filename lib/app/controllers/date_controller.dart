import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  Future<DateTime> pickerDateTime(BuildContext context) async {
    DateTime? picker = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
      initialDate: DateTime.now(),
    );

    if (picker != null) return picker;

    return DateTime.now();
  }

  Future<DateTime> selectDate(BuildContext context) async {
    // ... mendapatkan tanggal
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      // ... jika ada tanggal yang dipilih
      return picked;
    }

    // ... jika tidak ada tanggal yang dipilih
    return DateTime.now();
  }
}
