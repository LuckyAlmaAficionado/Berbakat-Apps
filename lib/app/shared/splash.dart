import 'package:flutter/material.dart';
import 'package:talenta_app/app/shared/theme.dart';

class SplashPageView extends StatelessWidget {
  const SplashPageView({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
