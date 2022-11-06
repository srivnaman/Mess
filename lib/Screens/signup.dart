import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  //const SignUp({super.key});
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('AppDev')),

    );
  }
}