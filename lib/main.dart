import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/binding.dart';
import 'package:kolay_wms_mobile/utils/root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KolayWMS',
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Root(),
    );
  }
}
