import 'package:flutter/material.dart';
import 'package:mess/Screens/MainScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
            title: 'Mess',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // routes: {
            //   Home.routeName:(ctx)=>Home(),
            //   Profile.routeName:(ctx)=>Profile(),
            //   Complaint.routeName:(ctx)=>Complaint(),
            //   MenuPage.routeName:(ctx)=>MenuPage(),
            // },
            home: MainScreen());
      },
      designSize: Size(361, 428),
    );
  }
}
