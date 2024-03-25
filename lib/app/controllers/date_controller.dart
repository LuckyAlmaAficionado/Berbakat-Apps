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

    if (picker != null) {
      return picker;
    }
    return DateTime.now();
  }
}
