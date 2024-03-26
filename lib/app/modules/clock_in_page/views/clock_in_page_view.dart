import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:talenta_app/app/routes/app_pages.dart';
import 'package:talenta_app/app/shared/loading_dialog.dart';

import 'package:talenta_app/app/shared/theme.dart';
import 'package:talenta_app/app/shared/utils.dart';

import '../controllers/clock_in_page_controller.dart';

class ClockInPageView extends GetView<ClockInPageController> {
  ClockInPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: controller.initializedLocation(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return new FlutterMap(
                        options: new MapOptions(
                          keepAlive: true,
                          initialCenter: new LatLng(controller.latitude.value,
                              controller.longitude.value),
                          interactionOptions: InteractionOptions(
                            enableMultiFingerGestureRace: false,
                            debugMultiFingerGestureWinner: false,
                          ),
                          initialZoom: 17,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: ['a', 'b', 'c'],
                            maxZoom: 19,
                          ),
                          new MarkerLayer(
                            markers: [
                              new Marker(
                                width: 45.0,
                                height: 45.0,
                                point: new LatLng(controller.latitude.value,
                                    controller.longitude.value),
                                child: Icon(
                                  Icons.location_on,
                                  color: blueColor,
                                  size: 40,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    } else {
                      return LoadingDialog(
                        text: "Tunggu Sebentar Yaa...",
                        icon: Icons.abc,
                      );
                    }
                  },
                ),
              ),

              // ...
              Container(
                height: 250,
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.black54,
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 50,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: darkGreyColor,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.statusAbsensi.value,
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Container(
                      width: Get.width,
                      height: 80,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Office 2',
                            style: blackTextStyle,
                          ),
                          Row(
                            children: [
                              Icon(Icons.date_range_outlined),
                              Text(
                                " ${DateFormat("dd MMM yyyy").format(DateTime.now())} (08:00 - 16:45)",
                                style: blackTextStyle.copyWith(
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      title: "Lampirkan",
                      onTap: () => Get.toNamed(
                        Routes.CAMERA_PAGE,
                        arguments: controller.statusAbsensi.value,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 40),
              decoration: BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
