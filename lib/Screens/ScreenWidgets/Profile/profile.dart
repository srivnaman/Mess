// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/Auth/login.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';
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

                  Center(
                    child: CircleAvatar(
                      radius: 63.r,
                      backgroundColor: Color(0xFF000A12),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('Assets/Images/user.png'),
                        radius: 60.r,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //ProfilePhotoContainer(),

                  SizedBox(
                    height: 10.h,
                  ),
                  SignoutOption(),

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

    /*TextButton (
      onPressed: () async{
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage(),),
      ),
      }, */
    //Widget: Widget)
  }
}

class ProfilePhotoContainer extends Profile {
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        'Mr. Bean',
                        style: TextStyle(
                          color: Color.fromRGBO(39, 105, 171, 1),
                          fontFamily: 'Nunito',
                          fontSize: 37.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://nextluxury.com/wp-content/uploads/funny-profile-pictures-10.jpg'),
                    radius: 100.r,
                    //child: Text('Eevee'),
                    //foregroundColor: Colors.red,
                  ),
                ),

                // child: Center(
                //   child: Container(
                //     height: 80.h,
                //     width: 80.h,
                //     decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         image: DecorationImage(
                //             image: NetworkImage(
                //                 'https://nextluxury.com/wp-content/uploads/funny-profile-pictures-10.jpg'))),
                //   ),
                // ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/*class MonthlyDashboard extends StatelessWidget {
  var thisHeight;
  var thisWidth;

  MonthlyDashboard(this.thisHeight, this.thisWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: thisWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'My Orders',
              style: TextStyle(
                color: Color.fromRGBO(39, 105, 171, 1),
                fontSize: 27.sp,
                fontFamily: 'Nunito',
              ),
            ),
            Divider(
              thickness: 2.5.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

// Orders and pending
/*Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Orders',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '10',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Pending',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    39, 105, 171, 1),
                                                fontFamily: 'Nunito',
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )*/

/*
class Profile extends StatelessWidget {
  static const routeName = '/profile';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(color: Color.fromARGB(255, 255, 255, 255)),
          Container(
            width: 250.w,
            child: Column(
              children: [Text("Profile")],
            ),
          )
        ],
      ),
    );
  }
}

*/
