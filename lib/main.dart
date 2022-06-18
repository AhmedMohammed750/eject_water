// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';
import 'package:water_edject/local/lacal.dart';
import 'package:water_edject/local/localcontrol.dart';
import 'package:water_edject/screens/navibar.dart';
import 'package:water_edject/thems.dart';

bool darkMode = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(mycontroll());
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        locale: Get.deviceLocale,
        translations: Mylocal(),
        theme: ThemeService().lightTheme,
        darkTheme: ThemeService().darkTheme,
        themeMode: ThemeService().getThemeMode(),
        debugShowCheckedModeBanner: false,
        home: nav(),
      );
    });
  }
}
