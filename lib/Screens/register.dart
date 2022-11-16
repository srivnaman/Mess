import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/Screens/MainScreen.dart';
import 'package:mess/Screens/signup.dart';
import 'package:mess/utils/fireAuth.dart';
import 'package:mess/utils/validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => ,
      //   ),
      // );
    }
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                "Login",
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
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 50.h,
                                              bottom: 10.h,
                                              left: 50.w,
                                              right: 50.w),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "User Name",
                                              filled: true,
                                              fillColor: Color(0xFF4F5B62),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10.h,
                                              bottom: 20.h,
                                              left: 50.w,
                                              right: 50.w),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              hintText: "Password",
                                              filled: true,
                                              fillColor: Color(0xFF4F5B62),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        SizedBox(
                                          width: 100.w,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor: Colors.white,

                                              backgroundColor: Color(
                                                  0xFF3F5C94), // foreground
                                            ),
                                            onPressed: () async {
                                            
                                              // User? user = await FireAuth
                                              //     .signInUsingEmailPassword(
                                              //   email:
                                              //       "srinaman2@gmail.com",
                                              //   password:
                                              //       "password",
                                              // );
                                              // if (user != null) {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainScreen()),
                                                );
                                              // }
                                            
                                          },
                                            child: Text("Sign In"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                          
                                        ),
                                        const Text(
                                          "Don't have an account?",
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                      ],
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
    );
  }
}
