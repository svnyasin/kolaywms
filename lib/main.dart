import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/binding.dart';
import 'package:kolay_wms_mobile/utils/root.dart';
import 'package:kolay_wms_mobile/utils/translations.dart';

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
      translations: Messages(), // your translations
      locale:Get.deviceLocale,// translations will be displayed in that locale
      fallbackLocale: Locale('en',
          'US'), // specify the fallback locale in case an invalid locale is selected.

      theme: theme,
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Root(),
    );
  }
}
