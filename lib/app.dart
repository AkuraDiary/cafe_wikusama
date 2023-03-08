import 'package:cafe_wikusama/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cafe_wikusama/common/bottom_nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      //Change AdminBottomNav() to display admin List features without login
    );
  }
}
