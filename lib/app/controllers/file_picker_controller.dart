import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FilePickerController extends GetxController {
  RxString? filePath;

  Future<void> openFilePicker() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        // ... user memilih file
        print("user memilih file");
        filePath!.value = result.files.single.path!;
      } else {
        // ... user tidak memilih file
      }
    } catch (e) {
      // ... penanganan
      throw ("terjadi error [_openFilePicker]: $e");
    }
  }

  Future<String> openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // filePath!.value = result.files.single.path!;
      return result.files.single.path!;
    }
    return '';
  }
}
