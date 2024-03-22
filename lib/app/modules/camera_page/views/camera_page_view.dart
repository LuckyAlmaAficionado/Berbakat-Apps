import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../shared/theme.dart';
import '../controllers/camera_page_controller.dart';

class CameraPageView extends GetView<CameraPageController> {
  const CameraPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Clock In',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Langkah 2 dari 2',
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: extraLight,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: blueColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Container(
            width: Get.width,
            height: Get.height * 0.1,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
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
                      "${DateFormat("dd MMMM yyyy", "id_ID").format(DateTime.now())} (08:00 - 16:45)",
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: FutureBuilder<void>(
              future: controller.initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(controller.cameraC);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Get.height * 0.58,
              width: Get.width,
              child: Image.asset(
                'assets/images/ic_dotted_border.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                padding: const EdgeInsets.all(20),
                height: Get.height * 0.21,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: darkGreyColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 5,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.format_align_left),
                        label: Text(
                          "Catatan (opsional)",
                          style: darkGreyTextStyle,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: Get.width,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: blueColor,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Kirim",
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
