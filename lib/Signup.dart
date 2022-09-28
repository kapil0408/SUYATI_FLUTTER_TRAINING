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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey, //key for form
          child: Column(
            children:  [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Name'
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                    //allow upper and lower case alphabets and space
                    return "Enter Correct Name";
                  }
                  else
                  {
                    return null;
                  }
                },
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Phone Number'
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)){
                    //r'^[0-9]{10}$' pattern plain match number with length 10
                    return "Enter Correct Phone Number";
                  }
                  else
                  {
                    return null;
                  }
                },
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Email'
                ),
                validator: (value){
                  if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                    //r'^[0-9]{10}$' pattern plain match number with length 10
                    return "Enter Correct Email Address";
                  }
                  else
                  {
                    return null;
                  }
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate())
                  {
                    //Check if form data are valid
                    // your process task ahead if all data are valid
                  }
                },
                child: const Text("Sign up")
              )
            ]),
        ),
      )
    );
  }
}