import 'package:get/get.dart';
import 'package:kolay_wms_mobile/controllers/add_items_controller.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/controllers/navbar_controller.dart';
import 'package:kolay_wms_mobile/controllers/stock_info_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<NavBarController>(NavBarController(), permanent: true);
    Get.put<AddItemsController>(AddItemsController(), permanent: true);
    Get.put<StockInfoController>(StockInfoController(), permanent: true);
  }
}
