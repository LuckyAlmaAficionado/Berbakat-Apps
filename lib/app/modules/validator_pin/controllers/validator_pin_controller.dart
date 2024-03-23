import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;
import 'package:talenta_app/app/controllers/authentication_controller.dart';

import '../../../shared/utils.dart';

class ValidatorPinController extends GetxController {
  /// ... controller
  TextEditingController validatorC = TextEditingController();
  final authC = Get.find<AuthenticationController>();

  /// ... deklarasi RxString
  RxString enteredPin = "".obs;
  RxString pin = "123456".obs;

  @override
  void onInit() {
    super.onInit();
    pin = authC.pin;
  }

  void checkPin(String validator) {
    if (enteredPin.value.length == 6) {
      if (enteredPin.value == pin.value) {
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
  }

  validatorFrom(String validator) {
    switch (validator) {
      case "non-aktif":
        dev.log("PIN dinonaktifkan");
        authC.resetPin();
        Get.back();
        break;
      case "aktif":
        dev.log("validator masuk aplikasi");
        break;
      default:
        break;
    }
  }

  resetTextField() {
    enteredPin.value = "";
    validatorC.text = "";
  }
}
