import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/widgets/text_field_container.dart';

class ForgotPasswordPage extends GetWidget<AuthController> {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("forgot_password".tr),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/business_failure.png",
                height: Get.size.height * 0.25,
              ),
              SizedBox(height: Get.size.height * 0.03),
              TextFieldContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "email".tr,
                    border: InputBorder.none,
                  ),
                  controller: emailController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                    controller.resetPassword(emailController.text);
                  },
                  child: Text(
                    "send".tr,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
