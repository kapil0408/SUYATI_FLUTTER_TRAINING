import 'package:flutter/material.dart';
import 'package:suyati_flutter_training/validator.dart';
import 'constant.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  
  final formKey = GlobalKey<FormState>(); //Key for Form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Signup")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
              bottom: 50), // This is for scrolling from bottom
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey, //key for form
              child: Column(children: [
                const SizedBox(
                  height: 0.0,
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset(
                    'assets/yoga.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    suffixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  validator: (value) {
                    if (Validator.isEmptyString(value!)) {
                      return Constants.checkEmptyUsername;
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    suffixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  validator: (value) {
                    if (Validator.isEmptyString(value!)) {
                      return Constants.checkEmptyEmail;
                    } else if (Validator.validateEmail(value)) {
                      return Constants.checkValidEmail;
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    suffixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  validator: (value) {
                    if (Validator.isEmptyString(value!)) {
                      return Constants.checkEmptyPhoneNumber;
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: const Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  validator: (value) {
                    if (Validator.isEmptyString(value!)) {
                      return Constants.checkPasswordLength;
                    } else if (Validator.validatePasswordLength(value)) {
                      return Constants.checkEmptyPassword;
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    suffixIcon: const Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  validator: (value) {
                    if (Validator.isEmptyString(value!)) {
                      return Constants.checkEmptyConfirmPassword;
                    }
                     else if (Validator.passwordMatch(password.text, confirmPassword.text)){
                      return Constants.passwordDoesNotMatch;
                    }
                    else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //Check if form data are valid
                        // your process task ahead if all data are valid
                      }
                    },
                    child: const Text("Sign up"))
              ]),
            ),
          ),
        ));
  }
}
