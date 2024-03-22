import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talenta_app/app/controllers/authentication_controller.dart';
import 'package:talenta_app/app/shared/utils.dart';

import '../../../../shared/theme.dart';

class PinManagetView extends StatefulWidget {
  const PinManagetView({super.key});

  @override
  State<PinManagetView> createState() => _PinManagetViewState();
}

class _PinManagetViewState extends State<PinManagetView> {
  RxString pin = "".obs;
  RxInt currentIndex = 0.obs;

  RxBool isFirstAttempt = true.obs;

  late String tempPIN;

  AuthenticationController controller = Get.find<AuthenticationController>();

  FocusNode focusNode = FocusNode();
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                (isFirstAttempt.value)
                    ? "Masukan PIN baru"
                    : "Masukan ulang PIN",
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: Get.height * 0.08,
                child: Text(
                  (isFirstAttempt.value)
                      ? "Masukan 6 digit PIN baru untuk\nmasuk ke aplikasi Berbakat"
                      : "Masukan ulang 6 digit PIN baru",
                  style: darkGreyTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 50),
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

              // TextField yang tersembunyi untuk menampilkan keyboard
              TextField(
                style: whiteTextStyle,
                autofocus: true,
                focusNode: focusNode,
                controller: _textController,
                keyboardType: TextInputType.number,
                onChanged: (value) async {
                  if (isFirstAttempt.value) {
                    if (currentIndex.value < 6) {
                      _addNumber(int.parse(value[currentIndex.value]));
                      if (currentIndex.value == 5) {
                        // ... Jika password sudah di input semua

                        // ... disimpan terlebih dahulu untuk nanti di sandingkan
                        tempPIN = _textController.text;
                        isFirstAttempt(false);

                        /// ... buat untuk pengecekan kedua
                        setState(() {
                          currentIndex.value = 0;
                          _textController.text = "";
                          pin.value = "";
                        });
                        return;
                      }

                      currentIndex.value++;
                    }
                  } else {
                    print("pengecekan kedua");
                    // .... pengecekan kedua
                    if (currentIndex.value < 6) {
                      _addNumber(int.parse(value[currentIndex.value]));
                      if (currentIndex.value == 5) {
                        // ... Jika password sudah di input semua

                        if (tempPIN.contains(_textController.text)) {
                          // ... jika berhasil maka
                          await controller.savePin(_textController.text);
                          // ...
                          Get.back();
                          Utils().snackbarC(
                            "Berhasil..!",
                            "Berhasil mengaktifkan PIN",
                            true,
                          );
                        } else {
                          // ... jika salah memasukan pin pertama dan pin kedua
                          Utils().snackbarC(
                            "Oh Tidak..!",
                            "PIN yang anda masukan tidak sama",
                            false,
                          );
                        }

                        /// ... buat untuk pengecekan kedua
                        setState(() {
                          currentIndex.value = 0;
                          _textController.text = "";
                          pin.value = "";
                        });
                        return;
                      }

                      currentIndex.value++;
                    }
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
      width: 15.0,
      height: 15.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pin.value.length > index ? darkBlueColor : darkGreyColor,
      ),
    );
  }
}
