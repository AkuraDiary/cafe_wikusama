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
        child: Container(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
