import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:talenta_app/app/controllers/location_controller.dart';

class ClockInPageController extends GetxController {
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
    bool result = locationC.isWithinRange(
        latitude.value, longitude.value, -7.707543, 110.607353, 50);

    (result) ? print("dalam jangkauan") : print("diluar jangkauan");
  }

  @override
  void onInit() async {
    // assistant = new LocationAssistant(
    //     this, this, LocationAssistant.Accuracy.HIGH, 5000, false);
    super.onInit();
  }
}
