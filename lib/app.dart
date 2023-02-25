import 'package:cafe_wikusama/BottomNav.dart';
import 'package:cafe_wikusama/presentation/pages/Kasir/home.dart';
import 'package:flutter/material.dart';
import 'package:cafe_wikusama/presentation/pages/home_page.dart';
import 'package:cafe_wikusama/presentation/pages/Kasir/listview_home.dart';
import 'package:cafe_wikusama/presentation/pages/Kasir/listview_home2.dart';
import 'package:cafe_wikusama/presentation/pages/Kasir/checkout.dart';
import 'package:cafe_wikusama/presentation/pages/Manager/Statistict food.dart';
import 'package:cafe_wikusama/presentation/pages/Admin/Table_List.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: AdminBottomNav(),
    );
  }
}
