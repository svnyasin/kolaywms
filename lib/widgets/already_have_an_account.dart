import 'package:flutter/material.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:get/get.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function()? press;
  const AlreadyHaveAnAccount({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "dont_have_an_account".tr : "already_have_an_account".tr,
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: () => press!(),
          child: Text(
            login ? "sign_up".tr : "log_in".tr,
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
