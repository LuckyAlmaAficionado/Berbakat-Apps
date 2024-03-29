import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as dev;
import 'package:talenta_app/app/controllers/authentication_controller.dart';
import 'package:talenta_app/app/routes/app_pages.dart';

import 'package:local_auth/local_auth.dart';
import '../../../shared/utils.dart';

class ValidatorPinController extends GetxController {
  /// ... controller
  TextEditingController validatorC = TextEditingController();
  final authC = Get.find<AuthenticationController>();
  LocalAuthentication localAuthentication = LocalAuthentication();
  RxBool isAvailable = false.obs;
  RxBool isAuthenticated = false.obs;
  RxString text = ''.obs;

  /// ... deklarasi RxString
  RxString enteredPin = "".obs;
  RxString pin = "".obs;

  @override
  void onInit() {
    super.onInit();
    pin.value = authC.pin.value;

    // .... melakukan pengecekan jika menggunakan authentication
    if (authC.isAuthenticationOn.value)
      checkLocalAuthentication(Get.arguments ?? "signin");
  }

  checkLocalAuthentication(String status) async {
    isAvailable(await localAuthentication.canCheckBiometrics);
    if (isAvailable.value) {
      List<BiometricType> types =
          await localAuthentication.getAvailableBiometrics();
      text("Biometric Available");
      for (var item in types) {
        text.value += "\n- $item";
      }
    }

    await isLocalAuthenticationAvailable(status);
  }

  isLocalAuthenticationAvailable(String status) async {
    // ... mendapatkan data apakah user ter-autentikasi
    isAuthenticated.value = await localAuthentication.authenticate(
        localizedReason: "Please Authenticate",
        options: AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ));

    // ... jika benar maka
    if (isAuthenticated.value && status.contains("signin")) {
      Get.offAllNamed(Routes.DASHBOARD_PAGE);
      return;
    } else if (isAuthenticated.value && status.contains("slip-gaji")) {
      Get.toNamed(Routes.SLIP_GAJI_PAGE);
      return;
    }
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
