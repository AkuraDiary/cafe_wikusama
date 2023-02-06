import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_validator/form_validator.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String id = 'lesson';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Initially password is obscure
  bool isLoading = false;
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      }); // TODO
      String email = emailController.text;
      String password = passwordController.text;
      Fluttertoast.showToast(msg: "email : $email, password : $password");
      // Provider.of<AuthNotifier>(context, listen: false).login(
      //   username: usernameController.text,
      //   password: passwordController.text,
      // );

    }
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://s3-alpha-sig.figma.com/img/5910/ec35/a763731970db1d8a019c7d83e29aa619?Expires=1675641600&Signature=bxO3kIdx9e7fOgS~TE1-42irCn3UjkF6crtC2Sx1~7c20N2dLhRyc-82NJrRnpoQCm9kOjVo01zKCaf4BMfLg~KUCiHR~Mwo3DS9hC6tA9n-wlYsMCZnWRagXNW852ZszAMR5xeGoJT2JOEqEEZNLqwsIw15qluQsUUbNQoj~p7jvWmS5csQQGlfTzdVIaDdzgFhsTB24ov2Ip0f7CMvv4HLk4Oz1N0QyDxOAt~3MoQRwSgmXTc6mTHwSI1BICi7Jfv~6CLbDNvg2vi-wv74KeBZRKhsXgd4ogdX96U1LbevJrvP2keZfwb4sxrpTo370ZYB0km0ZbCa81JIttcAjw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'
                  ),
                opacity: 150,
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
                      Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://s3-alpha-sig.figma.com/img/6d79/bf94/d54e77bf7ffe4421c9a0eea6177b24db?Expires=1676246400&Signature=Gu6kDVEj-gCt~jLb5KcUT2Wp6g5bYzIjIxwd51o0RoJveOQlxKjhkHdPX7aqQtknpU9X~sXDdPq2gvnry7iq80VnDMcPL72~98TZSNK~9Y0aqCxkwu1gy7GFXAB23ZTFJI91Zhu1fPOFD89fi-CLc8ltjw4VHkWmXjvGjQ-91dbM6OD7zBUxAjml57M652XWeDkY2CQFy9wDEhBI-yTkccBkc0l7SPvyyYNzMxVg8Ti3jWFiSP9Kfh6Wv40PyvDFQf~SFU3IxzFzy4NDhvRlDcz3xNhzY~cn2ENOS59rG7BgpHzJg5n-wxYAZpYBrAJslWEG4Z9y7ssgIdQPmIlHhw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4') ,
                          radius: 80,
                          backgroundColor: Colors.transparent,
                      )
                      )
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
                    child: Column(
                      children: [
                        const SizedBox(height: 60,),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 25
                          ),
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
                            children: [

                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                                child: TextFormField(
                                  controller: emailController,
                                  validator: ValidationBuilder().required().email().build(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10
                                    ),
                                    labelText: 'Email',

                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey
                                    )
                                  ),
                                ),
                              ),


                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                                child: TextFormField(
                                  obscureText: _obscureText,
                                  controller: passwordController,
                                  validator: ValidationBuilder().required().build(),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10
                                    ),

                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                        icon: _obscureText
                                            ? const Icon(Icons.visibility)
                                            : const Icon(Icons.visibility_off)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35,),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: MaterialButton(
                            onPressed: (){
                              _validateAndSubmit();
                            },
                            height: 45,
                            minWidth: double.infinity,
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
                        ),
                        const SizedBox(height: 25,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
