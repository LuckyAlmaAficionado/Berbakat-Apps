import 'package:get/get.dart';

import '../controllers/slider_page_controller.dart';

class SliderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliderPageController>(
      () => SliderPageController(),
    );
  }
}
