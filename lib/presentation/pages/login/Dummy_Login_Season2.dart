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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green.shade900,
              Colors.green,
              Colors.green.shade400,
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          )
        ),
        child: Column(
          children: [
            Container(
              height: 210,
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
              flex: 3,
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
