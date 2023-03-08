import 'dart:io';

import 'package:cafe_wikusama/dependecy_injection.dart';
import 'package:flutter/material.dart';

import 'package:cafe_wikusama/app.dart';
import 'package:cafe_wikusama/dependecy_injection.dart' as di;
import 'package:cafe_wikusama/common/my_http_overrides.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  di.init();
  await locator.isReady<SharedPreferences>();
  runApp(

    const MyApp(),
  );
}
