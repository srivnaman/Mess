// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/Screens/ScreenWidgets/userSettings.dart';
//import 'package:mess/widgets/profileContainer.dart';
//import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: null, // () {UserSetting();}, 
                        icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Faculty Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      //fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  
                  ProfilePhotoContainer(height),

                  SizedBox(
                    height: 30,
                  ),
                  
                  MonthlyDashboard(height,width),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


class ProfilePhotoContainer extends Profile {
  var thisHeight;
  ProfilePhotoContainer(this.thisHeight);
  Widget build(BuildContext context) {
    return Container(
                    height: thisHeight * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          //fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 180.h,
                                //height: innerHeight * 0.72,
                                //width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                    ),
                                    Text(
                                      'Mr. Bean',
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 37,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
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
                                child: Container(
                                  height: 180.h,
                                  width: 180.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2zZym9e7cviX9dFlBzpXxq3EcYunn1RG-MkT876kvJY9G-59hTF7zPGrtxrPBLhzsHTM&usqp=CAU'))
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
      }
}


class MonthlyDashboard extends StatelessWidget {
  var thisHeight;
  var thisWidth;

  MonthlyDashboard(this.thisHeight,this.thisWidth);

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: thisHeight * 0.5,
                    width: thisWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'My Orders',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: thisHeight * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: thisHeight * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
  }
}



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
