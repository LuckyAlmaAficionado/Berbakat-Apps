import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenta_app/app/controllers/authentication_controller.dart';
import 'package:talenta_app/app/shared/utils.dart';

import '../../../routes/app_pages.dart';

class SignInPageController extends GetxController {
  RxBool isObsecure = true.obs;

  final authC = Get.find<AuthenticationController>();

  late TextEditingController emailC;
  late TextEditingController passwordC;

  @override
  void onInit() {
    emailC = TextEditingController(text: "admin@gmail.com");
    passwordC = TextEditingController(text: "123456");
    super.onInit();
  }

  bool validatorTextfield() {
    if (emailC.text.isEmpty) {
      return false;
    } else if (passwordC.text.isEmpty) {
      return false;
    }
    return true;
  }

  bool validatorEmailAndPassword() {
    if (!emailC.text.contains("admin@gmail.com")) {
      return false;
    } else if (!passwordC.text.contains("123456")) {
      return false;
    }
    return true;
  }

  login() {
    if (!validatorTextfield()) {
      Utils().snackbarC("Oh Tidak..!", "email atau password kosong..!", false);
      return;
    }

    if (!validatorEmailAndPassword()) {
      Utils().snackbarC("Oh Tidak...!", "email atau password salah...!", false);
      return;
    }

    Get.toNamed(Routes.DASHBOARD_PAGE);
  }
}
