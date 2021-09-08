import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/controllers/auth_controller.dart';
import 'package:kolay_wms_mobile/utils/root.dart';

class IntroductionPage extends GetWidget<AuthController> {
  IntroductionPage({Key? key}) : super(key: key);

  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "intro1_title".tr,
      body: "intro1_body".tr,
      image: Image.asset("assets/images/welcome.png", height: 300.0),
      decoration: PageDecoration(
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
    PageViewModel(
      title: "intro2_title".tr,
      body: "intro2_body".tr,
      image: Image.asset("assets/images/failure.png", height: 300.0),
      decoration: PageDecoration(
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
    PageViewModel(
      title: "intro3_title".tr,
      body: "intro3_body".tr,
      image: Image.asset("assets/images/ways.png", height: 300.0),
      decoration: PageDecoration(
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
    PageViewModel(
      title: "intro4_title".tr,
      body: "intro4_body".tr,
      image: Image.asset("assets/images/management.png", height: 300.0),
      decoration: PageDecoration(
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          controller.launch.value = false;
          Get.offAll(Root());
        },
        showSkipButton: true,
        skip: Text("skip".tr,
            style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.w600)),
        next: Text("next".tr,
            style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.w600)),
        done: Text("get_started".tr,
            style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: theme.accentColor,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
