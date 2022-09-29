import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
         
    );
  }

  void showForgetPasswordDialog()
  {
    showDialog(
      context: context, 
      builder: (_) {
          var emailController = TextEditingController();
          return AlertDialog(
            title: const Text('Forget Password'),
            content: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller:emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                )
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel'),),
              TextButton(
                onPressed: () {
                var email = emailController.text;
                Navigator.pop(context);
              },
              child: const Text('Send'),
              )
            ],
          );
      }
    );
  }
}