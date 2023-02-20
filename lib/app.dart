import 'package:cafe_wikusama/BottomNav.dart';
import 'package:cafe_wikusama/presentation/pages/dummy/home.dart';
import 'package:flutter/material.dart';
import 'package:cafe_wikusama/presentation/pages/home_page.dart';
import 'package:cafe_wikusama/presentation/pages/dummy/listview_home.dart';
import 'package:cafe_wikusama/presentation/pages/dummy/listview_home2.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeBottomNav(),
    );
  }
}