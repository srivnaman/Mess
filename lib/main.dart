import 'package:flutter/material.dart';
import 'package:mess/Screens/MainScreen.dart';
import 'package:mess/Screens/ScreenWidgets/complaint.dart';
import 'package:mess/Screens/ScreenWidgets/home.dart';
import 'package:mess/Screens/ScreenWidgets/profile.dart';
import 'package:mess/Screens/register.dart';
import 'package:mess/Screens/ScreenWidgets/menu.dart';
import 'package:mess/widgets/GBottomNavBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
    );
  }
}
