import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:talenta_app/app/shared/theme.dart';
import 'package:talenta_app/app/shared/utils.dart';

import '../controllers/telat_masuk_page_controller.dart';

class TelatMasukPageView extends GetView<TelatMasukPageController> {
  const TelatMasukPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pengajuan Telat Masuk',
            style: appBarTextStyle,
          ),
          backgroundColor: darkBlueColor,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const Gap(20),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Alasan Keterlambatan",
                    hintStyle: darkGreyTextStyle,
                    prefixIcon: Icon(
                      Icons.format_align_left_outlined,
                      color: darkGreyColor,
                    ),
                  ),
                ),
                const Gap(20),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "Catatan Tambahan",
                    hintStyle: darkGreyTextStyle,
                    prefixIcon: Icon(
                      Icons.format_align_left_outlined,
                      color: darkGreyColor,
                    ),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? picker = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (picker != null) {
                      controller.timePicker.value = picker.format(context);
                      controller.rentangWaktu(controller
                          .calculateLateMinutes(picker.format(context)));
                    }
                  },
                  child: Container(
                    width: Get.width,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: darkGreyColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.date_range_outlined),
                        const Gap(10),
                        Obx(
                          () => Text(
                            (controller.timePicker.isEmpty)
                                ? "Waktu masuk sesungguhnya"
                                : controller.timePicker.value,
                            style: darkGreyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Obx(
                  () => Text(
                    'Lama Terlambat: ${controller.rentangWaktu.value} Menit',
                    style: redTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: CustomButton(
                title: 'Ajukan Telat Masuk',
                onTap: () {},
              ),
            ),
          ],
        ));
  }
}
