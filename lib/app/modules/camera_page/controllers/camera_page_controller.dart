import 'package:camera/camera.dart';
import 'package:get/get.dart';

import 'package:talenta_app/app/controllers/camera_data_controller.dart';

class CameraPageController extends GetxController {
  final cameraController = Get.find<CameraDataController>();
  late CameraController cameraC;
  late Future<void> initializeControllerFuture;

  @override
  void onInit() {
    super.onInit();
    cameraC = CameraController(cameraController.camera, ResolutionPreset.max);
    initializeControllerFuture = cameraC.initialize();
    print(cameraController.toString());
  }

  @override
  void dispose() {
    cameraC.dispose();
    super.dispose();
  }

  void takePicture() async {
    if (!cameraC.value.isInitialized) {
      return;
    }

    try {
      final XFile picture = await cameraC.takePicture();
      // Lakukan sesuatu dengan gambar yang diambil, misalnya menampilkan di layar
      print(picture.path);
    } catch (e) {}
  }
}
