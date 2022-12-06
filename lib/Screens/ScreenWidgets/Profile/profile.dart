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
  String role = 'unkonwn';
  String email = 'unknown';
  getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final currentUserData =
    await FirebaseFirestore.instance.doc('users/' + uid!).get();
    //email = currentUserData['email'];
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
    return Stack(
      //fit: StackFit.expand,
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: ProfilePicture(
                      name: "${widget.user.displayName}",
                      role: "${role}",
                      radius: 50.r,
                      fontsize: 40,
                      //random: true,
                      //tooltip: true,
                      //img: 'https://avatars.githubusercontent.com/u/37553901?v=4',
                    ),
                  ),

                  // Center(
                  //   child: CircleAvatar(
                  //     radius: 63.r,
                  //     backgroundColor: Color(0xFF000A12),
                  //     child: CircleAvatar(
                  //       backgroundImage: AssetImage('Assets/Images/user.png'),
                  //       radius: 60.r,
                  //     ),
                  //   ),
                  // ),


                  SizedBox(
                    height: 15.h,
                  ),
                  //ProfilePhotoContainer(),
                  Text(
                    "${widget.user.displayName}",
                    style:TextStyle(
                      color: Colors.white70,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                    ),
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  Text(
                    "${role}",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                    ),
                  ),

                  SizedBox(
                    height: 15.h,
                  ),
                  Image.asset('Assets/Images/pngegg.png',
                      height: 200,
                      scale: 2.5,
                      // color: Color.fromARGB(255, 15, 147, 59),
                      opacity:
                      const AlwaysStoppedAnimation<double>(0.5)),


                  // Text(
                  //   "${email}",
                  //   style: TextStyle(
                  //       color: Color(0xFBD85585),
                  //       fontSize: 19.sp,
                  //       fontWeight: FontWeight.w600),
                  // ),
                  SizedBox(
                    height: 5.h,
                  ),

                  SignoutOption(),

                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(250,8,8,8),
                  //   child: Row(
                  //     children: [
                  //       SignoutOption(),
                  //     ],
                  //   ),
                  //

                  //MonthlyDashboard(20.h, 500.w),
                ],
              ),
            ),
          ),
        )
      ],
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



// Container(
//   height: 25.h,
//   width: 150.h,
//   decoration: BoxDecoration(
//     //color: Colors.blueAccent,
//     borderRadius: BorderRadius.circular(15),
//     border: Border.all(
//       width: 0.5,
//       color: Colors.black
//     ),
//     boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1)]
//   ),
//   child: Center(
//     child: Text(
//       "${role}",
//       //overflow: TextOverflow.ellipsis,
//       style: TextStyle(
//         color: Colors.white70,
//         fontSize: 19.sp,
//         fontWeight: FontWeight.w600,
//         fontStyle: FontStyle.italic,
//         fontFamily: 'Open Sans',
//       ),
//     ),
//   ),
// ),


