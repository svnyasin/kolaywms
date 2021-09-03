import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/pages/home.dart';
import 'package:kolay_wms_mobile/pages/introduction.dart';
import 'package:kolay_wms_mobile/pages/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    print(controller.user?.uid);
    return Obx(() => controller.checkDone.value == false ? Scaffold(body: Center(child: CircularProgressIndicator(),),): controller.launch.value == true
        ? IntroductionPage()
        : controller.user?.uid != null
            ? HomePage()
            : LoginPage());
  }
}
