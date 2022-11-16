import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/Auth/widgets/customForm.dart';
import 'package:mess/Screens/MainScreen.dart';
import 'package:mess/Auth/login.dart';
import 'package:mess/Auth/fireAuth.dart';
import 'package:mess/Auth/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  var _isProcessing = false;

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  void _submitToDB() async {
    final curUser = FirebaseAuth.instance.currentUser;
    final name = _nameTextController.text;

    await FirebaseFirestore.instance.collection('users').doc(curUser!.uid).set(
      {
        'name': name,
      },
    );
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {}
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Scaffold(
                backgroundColor: Colors.transparent,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 5.h,
                ),
                body: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color(0xFF000A12),
                            Color(0xFF4F5B62),
                          ],
                        ),
                      ),
                    ),
                    FutureBuilder(
                      future: _initializeFirebase(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            margin: EdgeInsets.only(
                              top: 40.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Register",
                                  textScaleFactor: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "Welcome to the all in one mess app for IIIT Dharwad",
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 30.h,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(50.r),
                                          topLeft: Radius.circular(50.r),
                                        )),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 35.w, right: 35.w),
                                        child: Form(
                                          key: _registerFormKey,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 40.h,
                                              ),
                                              CustomForm(
                                                  hintTextValue: "Name",
                                                  TextController:
                                                      _nameTextController),
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              CustomForm(
                                                  hintTextValue: "Email",
                                                  TextController:
                                                      _emailTextController),
                                              SizedBox(height: 20.h),
                                              CustomForm(
                                                  hintTextValue: "Passwor",
                                                  TextController:
                                                      _passwordTextController),
                                              SizedBox(height: 15.h),
                                              _isProcessing
                                                  ? CircularProgressIndicator()
                                                  : ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color(0xFF3F5C94),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r),
                                                        ),
                                                      ),
                                                      onPressed: () async {
                                                        if (_registerFormKey
                                                            .currentState!
                                                            .validate()) {
                                                          setState(() {
                                                            _isProcessing =
                                                                true;
                                                          });

                                                          User? user =
                                                              await FireAuth
                                                                  .registerUsingEmailPassword(
                                                            name:
                                                                _nameTextController
                                                                    .text,
                                                            email:
                                                                _emailTextController
                                                                    .text,
                                                            password:
                                                                _passwordTextController
                                                                    .text,
                                                          );

                                                          setState(() {
                                                            _isProcessing =
                                                                false;
                                                          });

                                                          if (user != null) {
                                                            _submitToDB();
                                                            Navigator.of(
                                                                    context)
                                                                .pushReplacement(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MainScreen()),
                                                            );
                                                          }
                                                        }
                                                      },
                                                      child: Text(
                                                        'Register',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFFFFFFFF)),
                                                      ),
                                                    ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Already have an acount?",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoginPage()),
                                                        );
                                                      },
                                                      child: Text("Log In"))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
