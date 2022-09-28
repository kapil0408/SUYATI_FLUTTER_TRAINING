import 'package:flutter/material.dart';
import 'package:suyati_flutter_training/main.dart';
import 'Signup.dart';

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

  String? checkEmail(String strEmail)
  {
     String tmpStrEmail = strEmail.trim();
     if(tmpStrEmail.isEmpty){
       return "Please enter email";
     }
     else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(tmpStrEmail))
     {
        return "Please enter correct email";
     }
     else
     {
       return null;
     }
  }

  String? checkPassword(String strPassword)
  {
     String tmpStrPassword = strPassword.trim();
     if(tmpStrPassword.isEmpty){
       return "Please enter password";
     }
     else if(tmpStrPassword.length<6 && tmpStrPassword.length>10)
     {
        return "Please enter password between 6 to 10 characters";
     }
     else
     {
       return null;
     }
  }

  @override
  void initState() {
      email.text = "";
      password.text = "";
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width=MediaQuery.of(context).size.width;
    // double height=MediaQuery.of(context).size.height;
    // ignore: prefer_typing_uninitialized_variables
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 50), // This is for scrolling from bottom
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0,),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/yoga.png',fit: BoxFit.fill,),
                ),
    
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('Login',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
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
                          errorText: _isEmailError?strEmailMessage:null,
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      TextField(
                        obscureText: _isHidden,
                        controller: password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          errorText: _isPasswordError?"Passwrod length should be in 6 to 10":null,
                          suffixIcon: InkWell (onTap: _ClickPasswordView,
                          child: Icon(_isHidden? Icons.visibility : Icons.visibility_off,)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               const SizedBox(height: 30.0,),
               Padding(
                padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Text('Forget password?',style: TextStyle(fontSize: 20.0),),
                       // ignore: deprecated_member_use
                       RaisedButton(
                         child: const Text('Login', style: TextStyle(fontSize: 15),),
                         color: const Color(0xffEE7B23),
                         onPressed: (){
                           if(email.text.isEmpty){
                                setState(() {
                                  strEmailMessage = "Please enter email";
                                  _isEmailError = true;
                                });
                             }
                           else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.text))
                           {
                             setState(() {
                               strEmailMessage = "Please enter correct mail";
                              _isEmailError = true;
                             });
                           }
                           else if(password.text.isEmpty){
                             setState(() {
                                strPasswordMessage = "Please enter password";
                                _isPasswordError = true;
                             });
                           }
                           else if(password.text.length<6 && password.text.length>10){
                             setState(() {
                                strPasswordMessage = "Please enter password between 6 to 10 alphabets";
                                _isPasswordError = true;
                             });
                           }
                         }
                         ),
                        ],
                      ),
                   ),
            const SizedBox(height:20.0),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signup()));
              },
              child: const Text.rich(
                TextSpan(
                  text: 'Don\'t have an account ',
                  children: [
                    TextSpan(
                      text: 'Signup',
                      style: TextStyle(
                        color: Color(0xffEE7B23)
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _ClickPasswordView(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
