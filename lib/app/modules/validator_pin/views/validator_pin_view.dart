import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/validator_pin_controller.dart';

class ValidatorPinView extends GetView<ValidatorPinController> {
  const ValidatorPinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValidatorPinView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ValidatorPinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
