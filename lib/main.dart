import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_flutter_exchange_project/page/home/home.dart';
import 'package:getx_flutter_exchange_project/page/home/homecontroller.dart';

import 'app/transcation/transcation.dart';

void main() {
  Get.put(HomeController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    locale: Locale('pt', 'BR'),
    home: HomePage(),
    translationsKeys: AppTranslation.translations,
  ));
}
