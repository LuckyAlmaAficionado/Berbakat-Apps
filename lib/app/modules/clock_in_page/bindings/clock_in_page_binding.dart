import 'package:get/get.dart';

import '../controllers/clock_in_page_controller.dart';

class ClockInPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClockInPageController>(
      () => ClockInPageController(),
    );
  }
}
