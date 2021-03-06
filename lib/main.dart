import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolay_wms_mobile/constants.dart';
import 'package:kolay_wms_mobile/binding.dart';
import 'package:kolay_wms_mobile/utils/root.dart';
import 'package:kolay_wms_mobile/utils/translations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var isTurkish =
      prefs.getBool('isTurkish') ?? Get.deviceLocale.toString() == "tr_TR"
          ? true
          : false;

  runApp(MyApp(isTurkish, prefs));
}

class MyApp extends StatelessWidget {
  final bool isTurkish;
  final prefs;

  MyApp(this.isTurkish, this.prefs);
  @override
  Widget build(BuildContext context) {
    var isDark = prefs.getBool('isDark') ?? false;
    isDark
        ? Get.changeTheme(ThemeData.dark())
        : Get.changeTheme(ThemeData.light());

    return GetMaterialApp(
      title: 'KolayWMS',
      translations: Messages(),
      locale: isTurkish ? Locale('tr', 'TR') : Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      theme: theme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Root(),
    );
  }
}
