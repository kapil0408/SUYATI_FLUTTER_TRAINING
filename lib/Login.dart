import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:suyati_flutter_training/constant.dart';
import 'Signup.dart';
import 'Validator.dart';
import 'forgetpassword.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _isHidden = true;
  bool _isEmailError = false;
  bool _isPasswordError = false;
  String strEmailMessage = "";
  String strPasswordMessage = "";

  @override
  void initState() {
    email.text = "";
    password.text = "";
    var dataEncode = utf8.encode('Kapil:goyal');
    var enctest =  base64Encode(dataEncode);
    log("this is base 64 $enctest");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width=MediaQuery.of(context).size.width;
    // double height=MediaQuery.of(context).size.height;
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
            bottom: 50), // This is for scrolling from bottom
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/yoga.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      suffixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      errorText: _isEmailError ? strEmailMessage : null,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: _isHidden,
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: _isPasswordError ? strPasswordMessage : null,
                      suffixIcon: InkWell(
                          onTap: _clickPasswordView,
                          child: Icon(
                            _isHidden ? Icons.visibility_off : Icons.visibility,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Dialog(child: ForgetPassword());
                            // return AlertDialog(
                            //   title: const Text('Forget Password'),
                            //   content: Column(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       TextFormField(
                            //         controller: emailController,
                            //         decoration: const InputDecoration(
                            //             hintText: "Email"),
                            //       )
                            //     ],
                            //   ),
                            //   actions: [
                            //     TextButton(
                            //       onPressed: () => Navigator.pop(context),
                            //       child: const Text('Cancel'),
                            //     ),
                            //     TextButton(
                            //       onPressed: () {
                            //         var email = emailController.text;
                            //         Navigator.pop(context);
                            //       },
                            //       child: const Text('Send'),
                            //     )
                            //   ],
                            // );
                          });
                    },
                  ),

                  // ignore: deprecated_member_use
                  RaisedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 15),
                      ),
                      color: const Color(0xffEE7B23),
                      onPressed: () {
                        if (Validator.isEmptyString(email.text)) {
                          setState(() {
                            strEmailMessage = Constants.checkEmptyEmail;
                            _isEmailError = true;
                          });
                        } else if (Validator.validateEmail(email.text)) {
                          setState(() {
                            strEmailMessage = Constants.checkPasswordLength;
                            _isEmailError = true;
                          });
                        } else if (Validator.isEmptyString(password.text)) {
                          setState(() {
                            strPasswordMessage = Constants.checkEmptyPassword;
                            _isPasswordError = true;
                          });
                        } else if (Validator.validatePasswordLength(
                            password.text)) {
                          setState(() {
                            strPasswordMessage = Constants.checkPasswordLength;
                            _isPasswordError = true;
                          });
                        } else {
                          setState(() {
                            _isEmailError = false;
                            _isPasswordError = false;
                          });
                        }
                      }),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Signup()));
              },
              child: const Text.rich(
                TextSpan(text: 'Don\'t have an account ', children: [
                  TextSpan(
                    text: 'Signup',
                    style: TextStyle(color: Color(0xffEE7B23)),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clickPasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  // Future<http.Response> loginApi(String username, String password) {
  //   return http.post(
  //     Uri.parse(Constants.baseUrl + 'api/login'),
  //     headers: <String, String>{
        
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
      
  //     body: jsonEncode(<String, String>{
  //       'title': title,
  //     }),
  //   );
  // }
}
