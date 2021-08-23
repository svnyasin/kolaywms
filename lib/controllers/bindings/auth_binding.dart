import 'package:get/get.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/controllers/navbar_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<NavBarController>(NavBarController(), permanent: true);
  }
}
