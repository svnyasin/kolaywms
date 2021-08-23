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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: authController.user!.photoURL != null
                        ? ClipOval(
                            child: Image.network(
                              authController.user!.photoURL!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: 40,
                          ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    authController.user!.email!,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_right),
              title: Text("Profile"),
              onTap: () {
                print("Profil tıklandı");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_right),
              title: Text("Settings"),
              onTap: () {
                print("Profil tıklandı");
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              trailing: Icon(Icons.arrow_right),
              title: Text("Sign Out"),
              onTap: () {
                authController.signOut();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Kolay WBS'),
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
