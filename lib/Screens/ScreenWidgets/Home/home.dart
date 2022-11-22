// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Today\'s orders',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 56, 112),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  Divider(
                    thickness: 1.0.h,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 50.h, maxHeight: 70.h),
                        //height: 30.h,
                        //width: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 50.h, maxHeight: 70.h),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 50.h,maxHeight: 70.h),
                          //  height: 30.h,
                          //  width: 60.w,
                          decoration: BoxDecoration(
                          color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(20.r),
                       ),
                      ),
                    ],
                  ),
                 
                  SizedBox(height: 10.h,),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            //height: 10.h,
            //width: thisWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'My Orders',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 56, 112),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  Divider(
                    thickness: 1.0.h,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
