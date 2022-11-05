import 'package:flutter/material.dart';
import 'package:mess/UnusedFiles/BottomNavbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mess/widgets/GBottomNavBar.dart';


class MenuPage extends StatefulWidget {
  //const MenuPage({super.key});
  MenuPage({Key? key}) : super(key: key);
  int index =0;
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing Home Page"),
      ),
      
      bottomNavigationBar: gbottomNavBar(),
      //  bottomNavigationBar: BottomNavBar(),
    );
  }
}

