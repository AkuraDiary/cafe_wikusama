import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String id = 'lesson';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  void fireToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void fireToast2(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade900,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://s3-alpha-sig.figma.com/img/5910/ec35/a763731970db1d8a019c7d83e29aa619?Expires=1675641600&Signature=bxO3kIdx9e7fOgS~TE1-42irCn3UjkF6crtC2Sx1~7c20N2dLhRyc-82NJrRnpoQCm9kOjVo01zKCaf4BMfLg~KUCiHR~Mwo3DS9hC6tA9n-wlYsMCZnWRagXNW852ZszAMR5xeGoJT2JOEqEEZNLqwsIw15qluQsUUbNQoj~p7jvWmS5csQQGlfTzdVIaDdzgFhsTB24ov2Ip0f7CMvv4HLk4Oz1N0QyDxOAt~3MoQRwSgmXTc6mTHwSI1BICi7Jfv~6CLbDNvg2vi-wv74KeBZRKhsXgd4ogdX96U1LbevJrvP2keZfwb4sxrpTo370ZYB0km0ZbCa81JIttcAjw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'
              ),
            scale: 1.5,
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 450,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 35,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(height: 7.5,),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 60,),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 25
                        ),
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 10,
                              offset: const Offset(0,10),
                            )
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            TextField(
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10
                                ),
                                border: InputBorder.none,
                                hintText: 'Email',
                                isCollapsed: false,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                                )
                              ),
                            ),
                            Divider(
                              color: Colors.black54,
                              height: 1,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                border: InputBorder.none,
                                hintText: 'Password',
                                isCollapsed: false,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 35,),
                      MaterialButton(
                        onPressed: (){

                        },
                        height: 45,
                        minWidth: 240,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,       
                          ),
                        ),
                        textColor: Colors.white,
                        color: Colors.green.shade700,
                        shape: const StadiumBorder(),
                      ),
                      const SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
