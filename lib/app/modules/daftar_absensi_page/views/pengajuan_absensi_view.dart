import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talenta_app/app/shared/theme.dart';
import 'package:talenta_app/app/shared/utils.dart';

class PengajuanAbsensiView extends StatefulWidget {
  PengajuanAbsensiView({Key? key}) : super(key: key);

  @override
  State<PengajuanAbsensiView> createState() => _PengajuanAbsensiViewState();
}

class _PengajuanAbsensiViewState extends State<PengajuanAbsensiView> {
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pengajuan Absensi',
            style: appBarTextStyle,
          ),
          backgroundColor: darkBlueColor,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              height: Get.height,
              padding: const EdgeInsets.all(20),
              width: Get.width,
              child: Column(
                children: [
                  // ... pilih tanggal
                  TextFormField(
                    controller: timeController,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _selectDate(context);
                    },
                    decoration: InputDecoration(
                      labelText: 'Pick a date',
                      suffixIcon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true, // Jadikan text field hanya bisa dibaca
                  ),

                  // ... fiedl lainnya
                  Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: timeController,
                          decoration: InputDecoration(
                            labelText: 'Pick a date',
                            suffixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(),
                          ),
                          readOnly:
                              true, // Jadikan text field hanya bisa dibaca
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: CustomButton(
                title: "Kirim pengajuan",
                onTap: () {},
              ),
            ),
          ],
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        timeController.text = DateFormat("dd MMM yyyy", "id_ID")
            .format(picked); // Ubah format sesuai kebutuhan Anda
      });
    }
  }
}
