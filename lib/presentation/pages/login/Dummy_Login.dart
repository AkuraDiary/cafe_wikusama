import 'package:cafe_wikusama/app.dart';
import 'package:flutter/material.dart';

class LoginDummy extends StatefulWidget {
  const LoginDummy({super.key});

  @override
  State<LoginDummy> createState() => _LoginDummyState();
}

class _LoginDummyState extends State<LoginDummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            
            image: AssetImage(
              'assets/image/common/Logo_Background.png',
              
            )
          )
        ),
        child: Column(children: [
          Image.asset('assets/image/common/Login_Logo.png'),
          Container(
            height: 500,
            color: Colors.green,
            
          )
        ]),
      ),
    );
  }
}