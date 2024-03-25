import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;
import 'package:talenta_app/app/controllers/authentication_controller.dart';
import 'package:talenta_app/app/routes/app_pages.dart';

import '../../../shared/utils.dart';

class ValidatorPinController extends GetxController {
  /// ... controller
  TextEditingController validatorC = TextEditingController();
  final authC = Get.find<AuthenticationController>();

  /// ... deklarasi RxString
  RxString enteredPin = "".obs;
  RxString pin = "".obs;

  @override
  void onInit() {
    super.onInit();
    print(authC.pin.value);
    pin.value = authC.pin.value;
  }

  void checkPin(String validator) {
    if (validatorC.text == pin.value) {
      print("PIN is correct!");

      // Lakukan tindakan yang diperlukan setelah PIN benar
      validatorFrom(validator);
    } else {
      Utils().snackbarC("Oh Tidak..!", "PIN yang anda masukan salah!", false);
      print("PIN is incorrect!");
      // Lakukan tindakan yang diperlukan setelah PIN salah
    }
    resetTextField();
  }

  validatorFrom(String validator) {
    print(validator);
    switch (validator) {
      case "non-aktif":
        dev.log("PIN dinonaktifkan");
        authC.resetPin();
        Get.back();
        break;
      case "aktif":
        dev.log("validator masuk aplikasi");
        Get.toNamed(Routes.DASHBOARD_PAGE);
        break;
      case "slip-gaji":
        dev.log("masuk ke slip gaji");
        Get.toNamed(Routes.SLIP_GAJI_PAGE);
        break;
      default:
        dev.log("validator baru login");
        Get.offAllNamed(Routes.DASHBOARD_PAGE);
        break;
    }
  }

  resetTextField() {
    enteredPin.value = "";
    validatorC.text = "";
  }
}
