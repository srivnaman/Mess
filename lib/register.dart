import 'package:flutter/material.dart';
import 'package:mess/signup.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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
                elevation: 0.0,
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
                  Container(
                    margin: EdgeInsets.only(
                      top: 100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          textScaleFactor: 3,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                              top: 100,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(60.0),
                                  topLeft: Radius.circular(60.0),
                                )),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50,
                                        bottom: 10,
                                        left: 50,
                                        right: 50),
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
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        bottom: 20,
                                        left: 50,
                                        right: 50),
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
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,

                                        backgroundColor:
                                            Color(0xFF3F5C94), // foreground
                                      ),
                                      onPressed: () => {},
                                      child: Text("Sign In"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    //onPressed:
                                  ),
                                  const Text(
                                    "Don't have an account?",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const SignUp()),
                                        );
                                      },
                                      child: const Text(
                                        "Register",
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
