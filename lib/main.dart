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
import 'package:talenta_app/app/modules/slider_page/controllers/slider_page_controller.dart';
import 'package:talenta_app/app/shared/splash.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ... setting camera dan juga setting agar kamera yang digunakan adalah kamera belakang
  final camera = await availableCameras();
  final firstCamera = camera.firstWhere(
      (element) => element.lensDirection == CameraLensDirection.front);

  // ... set camera
  Get.put(CameraDataController(), permanent: true);
  // mengatur kamera pertama
  Get.find<CameraDataController>().setCamera(firstCamera);
  // ...

  if (Platform.isAndroid) {
    // ... mengatur warna notification bar agar transparan
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  // Inisialisasi tanggal bahasa indonesia
  await initializeDateFormatting("id_ID", null);

  // Inisialisasi authtentikasi
  final authC = await Get.put(AuthenticationController(), permanent: true);
  await authC.validatorPIN().then(
        (value) => runApp(
          MyApp(
            authC: authC,
          ),
        ),
      );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.authC});

  final AuthenticationController authC;

  @override
  Widget build(BuildContext context) {
    Get.put(SliderPageController()).checkCarouselStatus();

    return GetMaterialApp(
      title: "BERBAKAT",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      initialRoute: Routes.DASHBOARD_PAGE,
      getPages: AppPages.routes,
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
    );

    return FutureBuilder(
      future: authC.validatorPIN(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashPageView(),
          );
        } else if (snapshot.hasData) {
          bool isTrue = snapshot.data as bool;

          return GetMaterialApp(
            title: "BERBAKAT",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: false),
            initialRoute: (isTrue)
                ? Routes.VALIDATOR_PIN
                // ... apakah slider sudah pernah terbuka
                : (Get.find<SliderPageController>().isCarouselOpened.value)
                    ? Routes.SIGN_IN_PAGE
                    : Routes.SLIDER_PAGE,
            getPages: AppPages.routes,
            localizationsDelegates: [
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              MonthYearPickerLocalizations.delegate,
            ],
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Container(),
            ),
          );
        }
      },
    );
  }
}
