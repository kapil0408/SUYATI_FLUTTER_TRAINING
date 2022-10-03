import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      //allow upper and lower case alphabets and space
                      return "Enter Correct Name";
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
                    if (value!.isEmpty ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                            .hasMatch(value)) {
                      //r'^[0-9]{10}$' pattern plain match number with length 10
                      return "Enter Correct Phone Number";
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
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                      //r'^[0-9]{10}$' pattern plain match number with length 10
                      return "Enter Correct Email Address";
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
                    hintText: "Password",
                    suffixIcon: const Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                      //r'^[0-9]{10}$' pattern plain match number with length 10
                      return "Enter Correct Email Address";
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
                    hintText: "Confirm Password",
                    suffixIcon: const Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                      //r'^[0-9]{10}$' pattern plain match number with length 10
                      return "Enter Correct Email Address";
                    } else {
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
