import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/Auth/register.dart';
import 'package:mess/Auth/verifyEmail.dart';
import 'package:mess/Auth/widgets/customForm.dart';
import 'package:mess/Screens/MainScreen.dart';
import 'package:mess/Auth/login.dart';
import 'package:mess/Auth/fireAuth.dart';
import 'package:mess/Auth/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  var _isVerifying = false;
  var _isProcessing = false;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  // final _focusName = FocusNode();
  // final _focusEmail = FocusNode();
  // final _focusPassword = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user!.emailVerified) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MainScreen(user: user,),
        ),
      );
    }
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _focusName.unfocus();
        // _focusEmail.unfocus();
        // _focusPassword.unfocus();
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
                                  "Log In",
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
                                        child: _isVerifying
                                            ? VerifyEmail()
                                            : Form(
                                                key: _formKey,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 40.h,
                                                    ),
                                                    CustomForm(
                                                        isPasswordField: false,
                                                        hintTextValue: "Email",
                                                        TextController:
                                                            _emailTextController),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    CustomForm(
                                                        isPasswordField: true,
                                                        hintTextValue:
                                                            "Password",
                                                        TextController:
                                                            _passwordTextController),
                                                    SizedBox(height: 15.h),
                                                    _isProcessing == false
                                                        ? Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 100.w,
                                                                child:
                                                                    ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFF3F5C94),
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.r),
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    // _focusEmail
                                                                    //     .unfocus();
                                                                    // _focusPassword
                                                                    //     .unfocus();

                                                                    if (_formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      setState(
                                                                          () {
                                                                        _isProcessing =
                                                                            true;
                                                                      });

                                                                      User?
                                                                          user =
                                                                          await FireAuth
                                                                              .signInUsingEmailPassword(
                                                                        email: _emailTextController
                                                                            .text,
                                                                        password:
                                                                            _passwordTextController.text,
                                                                      );

                                                                      setState(
                                                                          () {
                                                                        _isProcessing =
                                                                            false;
                                                                      });

                                                                      if ((!user!
                                                                              .emailVerified) &
                                                                          (user !=
                                                                              null)) {
                                                                        _isVerifying =
                                                                            true;
                                                                        setState(
                                                                            () {});
                                                                      }

                                                                      if (user
                                                                          .emailVerified) {
                                                                        Navigator.of(context)
                                                                            .pushReplacement(
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                MainScreen(user: user,),
                                                                          ),
                                                                        );
                                                                      }
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    'Log In',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFFFFFFFF)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : CircularProgressIndicator(),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Opacity(
                                                      opacity: 0.5,
                                                      child: Image.asset(
                                                        'Assets/Images/spoon.png',
                                                        height: 75.h,
                                                        color:
                                                            Color(0xFF4F5B62),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Don't have an acount?",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            RegisterPage()),
                                                              );
                                                            },
                                                            child: Text(
                                                                "Register"))
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
