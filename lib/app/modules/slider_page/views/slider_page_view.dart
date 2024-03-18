import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'package:talenta_app/app/routes/app_pages.dart';
import 'package:talenta_app/app/shared/theme.dart';

import '../controllers/slider_page_controller.dart';

// ignore: must_be_immutable
class SliderPageView extends GetView<SliderPageController> {
  const SliderPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(
              () => CarouselSlider(
                carouselController: controller.carouselController,
                items: controller.slider,
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      controller.indexSlider.value = index,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                ),
              ),
            ),
            const SizedBox(height: 54),
            Container(
              width: Get.width,
              height: 300,
              margin: const EdgeInsets.fromLTRB(31, 54, 31, 42),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.text[controller.indexSlider.value]["title"]
                              .toString(),
                          textAlign: TextAlign.center,
                          style: blackTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 26),
                        Text(
                          controller.text[controller.indexSlider.value]
                                  ["subTitle"]
                              .toString(),
                          textAlign: TextAlign.center,
                          style: darkGreyTextStyle.copyWith(
                            fontWeight: regular,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 12,
                              child: Row(
                                children: List.generate(
                                  controller.slider.length,
                                  (index) => AnimatedContainer(
                                    width: (controller.indexSlider == index)
                                        ? 12
                                        : 5,
                                    height: (controller.indexSlider == index)
                                        ? 12
                                        : 5,
                                    margin: const EdgeInsets.only(right: 10),
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOutQuad,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: (controller.indexSlider == index)
                                          ? blueColor
                                          : darkGreyColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: blueColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(56),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (controller.isClicked.isFalse) {
                                      controller.isClicked(true);

                                      // ... masukan kondisi jika
                                      if (controller.slider.length - 1 ==
                                          controller.indexSlider.value) {
                                        // .. jika sesuai maka akan dilanjutkan ke halaman login
                                        Get.offNamed(Routes.SIGN_IN_PAGE);
                                      } else {
                                        // ... jika belum akan melanjutkan ke slider berikutnya
                                        controller.carouselController
                                            .nextPage();
                                      }

                                      controller.isClicked(false);
                                    }
                                  },
                                  child: Text(
                                    (controller.slider.length - 1 !=
                                            controller.indexSlider.value)
                                        ? "Lanjut"
                                        : "Login",
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semiBold,
                                    ),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
