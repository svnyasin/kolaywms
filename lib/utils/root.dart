import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/pages/home.dart';
import 'package:kolay_wms_mobile/pages/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.user?.uid != null ? HomePage() : LoginPage());
  }
}
