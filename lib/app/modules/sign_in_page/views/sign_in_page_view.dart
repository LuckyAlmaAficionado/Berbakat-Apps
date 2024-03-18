import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talenta_app/app/routes/app_pages.dart';
import 'package:talenta_app/app/shared/theme.dart';

import '../controllers/sign_in_page_controller.dart';

class SignInPageView extends GetView<SignInPageController> {
  const SignInPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Sign in dengan ID Karyawan',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'untuk sign in dengan Email, pastikan perusahaan Anda telah terdaftar perusahaan.',
                style: darkGreyTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Email',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Password',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width,
                height: 40,
                child: Obx(() => TextField(
                      obscureText: controller.isObsecure.value,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        suffixIcon: IconButton(
                          onPressed: () => controller.isObsecure.toggle(),
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: darkGreyColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: lightGreyColor,
                            width: 1,
                          ),
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 40,
                width: Get.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: darkBlueColor,
                  ),
                  onPressed: () => Get.toNamed(Routes.DASHBOARD_PAGE),
                  child: Text(
                    "Sign in",
                    style: whiteTextStyle.copyWith(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
