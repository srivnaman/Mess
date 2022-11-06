import 'package:flutter/material.dart';
import 'package:mess/Screens/complaint.dart';
import 'package:mess/Screens/home.dart';
import 'package:mess/Screens/profile.dart';
import 'package:mess/Screens/register.dart';
import 'package:mess/Screens/menu.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mess',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MenuPage());
  }
}
