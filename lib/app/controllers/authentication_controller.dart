import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talenta_app/app/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  // RxBools untuk status pin dan kebutuhan pin saat membuka aplikasi
  RxBool isPinActivated = false.obs;
  RxBool isNeededPinWhenOpenApps = false.obs;
  RxBool isAuthenticationOn = false.obs;

  // RxString untuk menyimpan pin
  RxString pin = "".obs;

  @override
  void onInit() {
    super.onInit();
    validatorPIN();
  }

  // Validasi data pin dari penyimpanan
  Future<bool> validatorPIN() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isPinActivatedValue = await prefs.getBool('isPinActivated');
    bool? isNeededPinWhenOpenAppsValue =
        await prefs.getBool('isNeededPinWhenOpenApps');
    bool? isOauthenticationOnValue = await prefs.getBool("isAuthenticationOn");
    String? pinValue = await prefs.getString('pin');

    if (isPinActivatedValue != null &&
        isNeededPinWhenOpenAppsValue != null &&
        pinValue != null) {
      isPinActivated(isPinActivatedValue);
      isNeededPinWhenOpenApps(isNeededPinWhenOpenAppsValue);
      pin.value = pinValue;
      isAuthenticationOn(isOauthenticationOnValue);
      return isNeededPinWhenOpenAppsValue;
    } else {
      initializedValidator();
      return false;
    }
  }

  // Inisialisasi data authentikasi
  void initializedValidatorAuthentication() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isAuthenticationOn", !isAuthenticationOn.value);
    validatorPIN();
  }

  // Inisialisasi data default jika tidak ada data di penyimpanan
  void initializedValidator() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isPinActivated', false);
    prefs.setBool('isNeededPinWhenOpenApps', false);
    prefs.setString('pin', "0");
    prefs.setBool("isAuthenticationOn", false);
    validatorPIN();
  }

  // Menyimpan pin ke penyimpanan
  Future<void> savePin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isPinActivated', true);
    prefs.setBool('isNeededPinWhenOpenApps', isNeededPinWhenOpenApps.value);
    prefs.setString('pin', pin);
    validatorPIN();
  }

  // Memeriksa apakah pin yang dimasukkan benar
  Future<bool> getPin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedPin = prefs.getString('pin');
    return storedPin == pin;
  }

  // Menghapus semua data di penyimpanan
  Future<void> resetPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    initializedValidator();
  }

  // Mengaktifkan kebutuhan pin saat membuka aplikasi
  Future<void> usePinWhenOpenApp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isPinActivated', isPinActivated.value);
    prefs.setBool(
        'isNeededPinWhenOpenApps', isNeededPinWhenOpenApps.toggle().value);
    prefs.setString('pin', pin.value);
    validatorPIN();
  }

  validatorPinWhenOpenApps() {
    if (isNeededPinWhenOpenApps.value) {
      Get.toNamed(Routes.VALIDATOR_PIN);
    } else {
      // jika aplikasi tidak di buka mengggunakan pin
      Get.toNamed(Routes.DASHBOARD_PAGE);
    }
  }

  // ... Biometrics Authentications

  // ... SignIn
  login(String email, String password) {}
}
