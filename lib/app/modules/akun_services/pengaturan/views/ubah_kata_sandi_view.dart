import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../shared/theme.dart';

class UbahKataSandiView extends GetView {
  const UbahKataSandiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ubah kata sandi',
          style: appBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: darkBlueColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Ubah Password',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Password Sekarang',
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
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
                'Password Baru',
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width,
                height: 40,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    suffixIcon: IconButton(
                      onPressed: () {},
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
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Konfirmasi Password Baru',
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: Get.width,
                height: 40,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    suffixIcon: IconButton(
                      onPressed: () {},
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
                ),
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
                  onPressed: () {},
                  child: Text(
                    "Simpan perubahan",
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
