import 'dart:developer' as dev;

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:talenta_app/app/shared/theme.dart';
import 'package:talenta_app/app/shared/utils.dart';

import '../../../controllers/locations_controller.dart';

class ClockInPageController extends GetxController {
  RxString statusAbsensi = ''.obs;
  @override
  void onInit() async {
    // assistant = new LocationAssistant(
    //     this, this, LocationAssistant.Accuracy.HIGH, 5000, false);
    super.onInit();
    statusAbsensi.value = Get.arguments;
  }

  var locationC = Get.put(LocationController());

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  initializedLocation() async {
    Position position;
    position = await locationC.getCurrentLocation();
    latitude.value = position.latitude;
    longitude.value = position.longitude;

    print(latitude.value);
    print(longitude.value);
    await isWithinRange();
  }

  isWithinRange() {
    print("masuk sini");
    bool result = locationC.isWithinRange(
        latitude.value, longitude.value, -9.774974, 110.395337, 50);

    (result)
        ? dev.log("dalam jangkauan")
        : Get.dialog(
            barrierDismissible: false,
            Center(
              child: Container(
                width: Get.width * 0.6,
                height: Get.width * 0.7,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.zoom_out_map_sharp,
                      size: 80,
                    ),
                    const SizedBox(height: 20),
                    DefaultTextStyle(
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                      child: Text(
                        "Anda berada di luar jangkauan kantor",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      title: "Tetap absen",
                      onTap: () => Get.back(),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
