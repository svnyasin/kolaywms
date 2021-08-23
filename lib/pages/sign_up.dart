import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/pages/login.dart';
import 'package:kolay_wms_mobile/widgets/already_have_an_account.dart';
import 'package:kolay_wms_mobile/widgets/text_field_container.dart';

class SignUpPage extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/maintenance.png",
              height: Get.size.height * 0.25,
            ),
            SizedBox(height: Get.size.height * 0.02),
            TextFieldContainer(
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  hintText: "Email",
                  border: InputBorder.none,
                ),
                controller: emailController,
              ),
            ),
            SizedBox(height: Get.size.height * 0.02),
            TextFieldContainer(
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  hintText: "Password",
                  border: InputBorder.none,
                ),
                controller: passwordController,
                obscureText: true,
              ),
            ),
            SizedBox(height: Get.size.height * 0.02),
            TextFieldContainer(
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  hintText: "Confirm Password",
                  border: InputBorder.none,
                ),
                controller: confirmPasswordController,
                obscureText: true,
              ),
            ),
            SizedBox(height: Get.size.height * 0.02),
            Container(
              height: 60,
              width: 310,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
                onPressed: () {
                  passwordController.text == confirmPasswordController.text
                      ? controller.createUser(
                          emailController.text, passwordController.text)
                      : Get.snackbar(
                          "Error",
                          "Passwords dont match",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                },
                child: Text(
                  "SIGNUP",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: Get.size.height * 0.02),
            AlreadyHaveAnAccount(
                login: false, press: () => Get.to(LoginPage())),
          ],
        ),
      )),
    );
  }
}
