import 'dart:io';

import 'package:flutter/material.dart';

import 'package:cafe_wikusama/app.dart';
import 'package:cafe_wikusama/dependecy_injection.dart' as di;
import 'package:cafe_wikusama/common/my_http_overrides.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  di.init();
  runApp(
    const MyApp(),
  );
}
