import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarAbsensiPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController controller;

  @override
  void onInit() {
    controller = TabController(length: 3, vsync: this);
    super.onInit();
  }
}
