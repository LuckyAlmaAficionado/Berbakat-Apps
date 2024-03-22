import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenta_app/app/shared/theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: darkBlueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class Utils {
  snackbarC(title, message, isTrue) => Get.showSnackbar(
        GetSnackBar(
          backgroundColor: (isTrue) ? Colors.green.shade50 : Colors.red.shade50,
          duration: const Duration(seconds: 2),
          title: "PIN Salah",
          message: "Masukan PIN lagi",
          titleText: Text(
            title,
            style: (isTrue)
                ? greenTextStyle.copyWith(fontWeight: semiBold)
                : redTextStyle.copyWith(fontWeight: semiBold),
          ),
          messageText: Text(
            message,
            style: (isTrue)
                ? greenTextStyle.copyWith(fontWeight: extraLight)
                : redTextStyle.copyWith(fontWeight: extraLight),
          ),
        ),
      );
}
