import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/theme.dart';
import '../controllers/validator_pin_controller.dart';

class ValidatorPinView extends GetView<ValidatorPinController> {
  ValidatorPinView({Key? key}) : super(key: key);

  final argument = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),
            Text(
              "BERBAKAT",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: Get.height * 0.08,
              child: Text(
                "Masukan 6 digit PIN Anda\nuntuk lanjut menggunakan Berbakat",
                textAlign: TextAlign.center,
                style: darkGreyTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 90),
            Obx(
              () => Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      duration: const Duration(milliseconds: 200),
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < controller.enteredPin.value.length
                            ? darkBlueColor
                            : darkGreyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              child: TextField(
                style: whiteTextStyle,
                controller: controller.validatorC,
                textAlign: TextAlign.center,
                autofocus: true,
                cursorColor: whiteColor,
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value) {
                  controller.enteredPin.value = value;
                  // Panggil fungsi untuk memeriksa PIN setiap kali PIN dimasukkan
                  controller.checkPin(argument);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
