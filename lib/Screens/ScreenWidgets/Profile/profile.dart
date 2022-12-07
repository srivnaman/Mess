// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/Auth/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class Profile extends StatefulWidget {
  final User user;
  Profile({required this.user});
  static const routeName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isSigningOut = false;
  String name = 'unknown';
  String? role;
  String email = 'unknown';
  getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final currentUserData =
        await FirebaseFirestore.instance.doc('users/' + uid!).get();
    name = currentUserData['name'];
    role = currentUserData['role'];

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.settings,
          //         color: Color.fromRGBO(255, 255, 255, 1),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ProfilePicture(
              name: "${widget.user.displayName}",
              radius: 50.r,
              fontsize: 40,
            ),
          ),
          // Center(
          //   child: CircleAvatar(
          //     backgroundColor: Colors.black,
          //     radius: 50.r,
          //     backgroundImage: AssetImage('Assets/Images/user.png'),
          //   ),
          // ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "${widget.user.displayName}",
            style: TextStyle(
              color: Color.fromARGB(230, 255, 255, 255),
              fontSize: 19.sp,
            ),
          ),
          SizedBox(
              width: 140.w,
              child: Divider(
                color: Colors.white54,
              )),
          role == null
              ? Text(
                  "Loading..",
                  style: TextStyle(
                    color: Color.fromARGB(230, 255, 255, 255),
                    fontSize: 15.sp,
                  ),
                )
              : Text(
                  "${role}",
                  style: TextStyle(
                    color: Color.fromARGB(230, 255, 255, 255),
                    fontSize: 15.sp,
                  ),
                ),
          SizedBox(
            height: 35.h,
          ),
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'Assets/Images/hot.png',
              height: 75.h,
              color: Color(0xFF4F5B62),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: 220.w,
            child: Text(
              "Come to think of it, throwing away food is one of the dumbest things we do.",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SignoutOption(),
        ],
      ),
    );
  }
}

class SignoutOption extends StatelessWidget {
  const SignoutOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          child: Container(
            child: Text(
              "Log Out",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
