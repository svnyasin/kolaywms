import 'package:flutter/material.dart';
import 'package:kolay_wms_mobile/pages/introduction/introduction.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KolayWMS',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}
