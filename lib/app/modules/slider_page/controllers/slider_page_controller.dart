import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderPageController extends GetxController {
  CarouselController carouselController = CarouselController();

  RxInt indexSlider = 0.obs;
  RxBool isClicked = false.obs;

  var text = [
    {
      "title": "Selamat datang\ndi Berbakat",
      "subTitle":
          "Akses lebih mudah untuk mengelola kebutuhan administrasi HR anda",
    },
    {
      "title": "Kelola administrasi HR di mana saja",
      "subTitle":
          "Anda dapat melakukan absen, mengejukan cuti serta administrasi terkait lainnya.",
    },
    {
      "title": "Selalu update dengan info kantor",
      "subTitle":
          "Pastikan notifikasi aktif agar tidak melewatkan info penting dari kantor anda",
    },
  ].obs;

  var slider = <Widget>[
    SizedBox(
      width: 300,
      height: 300,
      child: Image.asset(
        "assets/images/img_onboarding1.png",
        fit: BoxFit.contain,
      ),
    ),
    SizedBox(
      width: 300,
      height: 300,
      child: Image.asset(
        "assets/images/img_onboarding2.png",
        fit: BoxFit.contain,
      ),
    ),
    SizedBox(
      width: 300,
      height: 300,
      child: Image.asset(
        "assets/images/img_onboarding3.png",
        fit: BoxFit.contain,
      ),
    ),
  ].obs;
}
