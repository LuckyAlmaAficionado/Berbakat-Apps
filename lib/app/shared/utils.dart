import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenta_app/app/routes/app_pages.dart';
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
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontWeight: regular,
            fontSize: 14,
          ),
        ),
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
          duration: const Duration(seconds: 1),
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

  feedbackApps(BuildContext context) => showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        builder: (context) {
          return Container(
            height: Get.height * 0.3,
            padding: const EdgeInsets.all(20),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    color: darkGreyColor,
                  ),
                ),
                Text(
                  "Bagaimana pengalaman Anda\nmenggunakan aplikasi Berbakat?",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: List.generate(
                    5,
                    (index) => Expanded(
                      child: Icon(
                        Icons.emoji_emotions_outlined,
                        size: 50,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );

  exitRequestDialog() => Get.dialog(Center(
        child: Container(
          width: Get.width * 0.6,
          height: Get.width * 0.56,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                width: Get.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: darkBlueColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: DefaultTextStyle(
                    style: whiteTextStyle,
                    child: Text("Keluar dari Berbakat?")),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: blackTextStyle,
                    child: Text(
                      "Anda perlu login ulang untuk kembali.",
                      textAlign: TextAlign.center,
                    )),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Batal",
                      style: whiteTextStyle,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Get.offAllNamed(Routes.SIGN_IN_PAGE);
                    },
                    child: Text(
                      "Keluar",
                      style: whiteTextStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ));
}
