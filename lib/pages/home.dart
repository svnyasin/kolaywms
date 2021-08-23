import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/controllers/navbar_controller.dart';

class HomePage extends GetWidget<NavBarController> {
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kolay WBS'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => authController.signOut(),
          )
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              Center(
                child: Text(
                  'Index 0: Home',
                ),
              ),
              Center(
                child: Text(
                  'Index 1: Sale',
                ),
              ),
              Center(
                child: Text(
                  'Index 2: Add',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: kPrimaryColor,
          selectedIconTheme: IconThemeData(size: 30),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Sale',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Add',
            ),
          ],
        ),
      ),
    );
  }
}
