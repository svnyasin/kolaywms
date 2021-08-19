import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/pages/introduction/introduction.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
