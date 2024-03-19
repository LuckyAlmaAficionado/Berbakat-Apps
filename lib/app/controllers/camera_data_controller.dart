import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraDataController extends GetxController {
  late CameraDescription _camera;

  CameraDescription get camera => _camera;

  void setCamera(CameraDescription camera) {
    _camera = camera;
    update(); // Update state
  }
}
