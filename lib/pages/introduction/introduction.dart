import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/pages/introduction/page_list.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          print("Başlayalım");
        },
        showSkipButton: true,
        skip: Text("Atla",
            style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontWeight: FontWeight.w600)),
        next: Text("Sonraki",
            style: TextStyle(
                fontSize: 18,
                color: primaryColor,
                fontWeight: FontWeight.w600)),
        done: Text("Başlayalım",
            style: TextStyle(
                fontSize: 18,
                color: primaryColor,
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
