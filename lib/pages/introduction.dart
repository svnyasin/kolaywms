import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/pages/login.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage({Key? key}) : super(key: key);

  final List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "KolayWMS'e hoşgeldin!",
      body:
          "KolayWMS stoğunuzu, deponuzu yada envanterınızı kolayca yönetebilmeniz için özenle geliştirilmiş bir yönetim sistemidir.",
      image: Image.asset("assets/images/welcome.png", height: 300.0),
      decoration: PageDecoration(
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
    PageViewModel(
      title: "Sizi yönetim kaynaklı kayıplardan korur.",
      body:
          "Stok veya depo yönetimi doğru bir şekilde yapılmadığında ciddi kayıplar meydana gelebilir. KolayWMS sizi tüm bu dertlerden kurtarır.",
      image: Image.asset("assets/images/business_failure.png", height: 300.0),
      decoration: PageDecoration(
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
    PageViewModel(
      title: "Her senaryoda kullanılabilir.",
      body:
          "KolayWMS her türlü stok ve depolama senaryosunda kullanılabilecek şekilde geliştirilmiştir.",
      image: Image.asset("assets/images/maintenance.png", height: 300.0),
      decoration: PageDecoration(
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
    PageViewModel(
      title: "Yönetimin en kolay yolu.",
      body:
          "KolayWMS ürünleriniz hakkında her türlü bilgiye anında ulaşabilmenizi, deponuzun durumunu hem web hem mobil platformlardan anlık olarak takip etmenizi sağlar ve sizi etkinliğe ve verimliliğe ulaştırır.",
      image: Image.asset("assets/images/business_plan.png", height: 300.0),
      decoration: PageDecoration(
        imageFlex: 3,
        bodyFlex: 2,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        onDone: () {
          Get.off(LoginPage());
        },
        showSkipButton: true,
        skip: Text("Atla",
            style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.w600)),
        next: Text("Sonraki",
            style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
                fontWeight: FontWeight.w600)),
        done: Text("Başlayalım",
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
