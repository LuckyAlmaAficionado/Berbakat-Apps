import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenta_app/app/routes/app_pages.dart';
import 'package:talenta_app/app/shared/theme.dart';

class SplashPageView extends StatefulWidget {
  const SplashPageView({super.key});

  @override
  State<SplashPageView> createState() => _SplashPageViewState();
}

class _SplashPageViewState extends State<SplashPageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 2)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "BERBAKAT",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 30,
                ),
              )
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          Get.toNamed(Routes.DASHBOARD_PAGE);
          return Container();
        } else {
          return Center(
            child: Text("Something was error"),
          );
        }
      },
    );
  }
}
