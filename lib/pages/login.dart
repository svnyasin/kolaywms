import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/pages/forgot_password.dart';
import 'package:kolay_wms_mobile/pages/sign_up.dart';
import 'package:kolay_wms_mobile/widgets/already_have_an_account.dart';
import 'package:kolay_wms_mobile/widgets/text_field_container.dart';

class LoginPage extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/welcome.png",
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
            Column(
              children: [
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
              ],
            ),
            TextButton(
                onPressed: () => Get.to(ForgotPasswordPage()),
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: kPrimaryColor),
                )),
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
                  controller.login(
                      emailController.text, passwordController.text);
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () => controller.signInWithGoogle(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            AlreadyHaveAnAccount(
                login: true, press: () => Get.to(SignUpPage())),
          ],
        ),
      )),
    );
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFF000000),
        height: 1.5,
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String? iconSrc;
  final Function()? press;
  const SocialIcon({
    Key? key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press!(),
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconSrc!,
              height: 25,
              width: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Login with Google"),
          ],
        ),
      ),
    );
  }
}
