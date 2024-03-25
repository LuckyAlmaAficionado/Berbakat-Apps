import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:talenta_app/app/routes/app_pages.dart';

import 'package:talenta_app/app/shared/theme.dart';
import 'package:talenta_app/app/shared/utils.dart';

import '../controllers/clock_in_page_controller.dart';

class ClockInPageView extends GetView<ClockInPageController> {
  const ClockInPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.statusAbsensi.value.toUpperCase(),
                style: whiteTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 18,
                ),
              ),
              Text(
                'Langkah 1 dari 2',
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  fontWeight: extraLight,
                ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: darkBlueColor,
          actions: [
            IconButton(
              onPressed: () async {
                await controller.initializedLocation();
              },
              icon: Icon(
                Icons.refresh,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120),
            child: Container(
              width: Get.width,
              height: 80,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: whiteColor,
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
                        "${DateFormat("dd MMM yyyy").format(DateTime.now())} (08:00 - 16:45)",
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            FutureBuilder(
              future: controller.initializedLocation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: Get.width,
                    height: Get.height,
                    child: new FlutterMap(
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
                    ),
                  );
                } else {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      const SizedBox(height: 20),
                      Text(
                        "Tunggu Sebentar Yaa..!",
                        style: blueTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ));
                }
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: SizedBox(
                height: 50,
                child: CustomButton(
                  title: "Lampirkan",
                  onTap: () => Get.toNamed(Routes.CAMERA_PAGE),
                ),
              ),
            )
          ],
        ));
  }
}
