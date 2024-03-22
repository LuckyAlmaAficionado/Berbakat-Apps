import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:camera/camera.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'package:talenta_app/app/controllers/authentication_controller.dart';
import 'package:talenta_app/app/controllers/camera_data_controller.dart';

import 'app/routes/app_pages.dart';
import 'app/shared/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final camera = await availableCameras();
  final firstCamera = camera.firstWhere(
      (element) => element.lensDirection == CameraLensDirection.front);

  // ... set camera
  Get.put(CameraDataController(), permanent: true);
  Get.find<CameraDataController>()
      .setCamera(firstCamera); // mengatur kamera pertama
  // ...

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }
  await initializeDateFormatting("id_ID", null).then(
    (value) => runApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  final AuthenticationController authC =
      Get.put(AuthenticationController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "BERBAKAT",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}

class ValidatorPinView extends StatefulWidget {
  const ValidatorPinView({Key? key}) : super(key: key);

  @override
  State<ValidatorPinView> createState() => _ValidatorPinViewState();
}

class _ValidatorPinViewState extends State<ValidatorPinView> {
  RxString pin = ''.obs;
  late TextEditingController _textController;
  RxBool isLatestPassTrue = false.obs;
  final authC = Get.find<AuthenticationController>();
  FocusNode focusNode = FocusNode();
  int curIndex = 0;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    Future.delayed(
        Duration.zero, () => FocusScope.of(context).requestFocus(focusNode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Obx(() => Text(
                    "Masukkan PIN ${(isLatestPassTrue.value) ? "Baru" : "Saat ini"}",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  )),
              SizedBox(height: 10),
              Obx(() => Text(
                    (isLatestPassTrue.value)
                        ? "Masukkan 6 digit PIN baru untuk mengubah PIN"
                        : "Masukkan 6 digit PIN saat ini untuk mengubah PIN",
                    style: darkGreyTextStyle.copyWith(
                      fontWeight: regular,
                      fontSize: 14,
                    ),
                  )),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(0),
                  _buildDot(1),
                  _buildDot(2),
                  _buildDot(3),
                  _buildDot(4),
                  _buildDot(5),
                ],
              ),
              TextField(
                style: whiteTextStyle,
                autofocus: true,
                focusNode: focusNode,
                controller: _textController,
                keyboardType: TextInputType.number,
                onChanged: (value) async {
                  if (curIndex < 6) {
                    _addNumber(int.parse(value[curIndex]));
                    if (curIndex == 5) {
                      Get.offAllNamed(
                          Routes.DASHBOARD_PAGE); // Navigasi ke halaman utama
                    }
                    curIndex++;
                  }
                },
                showCursor: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method untuk menambahkan angka ke PIN
  void _addNumber(int number) {
    setState(() {
      // Maksimum 6 digit
      if (pin.value.length < 6) {
        pin.value += number.toString();
        _textController.text = pin.value;
      }
    });
  }

  // Method untuk membangun dot yang menunjukkan status PIN
  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pin.value.length > index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
