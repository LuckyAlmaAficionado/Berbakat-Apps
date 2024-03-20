import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:camera/camera.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'package:talenta_app/app/controllers/camera_data_controller.dart';

import 'app/routes/app_pages.dart';

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
  const MyApp({
    super.key,
  });

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
