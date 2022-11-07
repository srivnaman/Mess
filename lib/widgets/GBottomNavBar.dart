// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GbottomNavBar extends StatefulWidget {
  final Function manageSelectedIndex;
  GbottomNavBar({required this.manageSelectedIndex});
  @override
  State<GbottomNavBar> createState() => _GbottomNavBarState();
}

class _GbottomNavBarState extends State<GbottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor:
              Color.fromARGB(255, 59, 59, 59), //Colors.blueGrey,
          haptic: true, // haptic feedback
          tabBorderRadius: 20,
          curve: Curves.easeInOutCubic, // tab animation curves
          //duration: Duration(milliseconds: 10), // tab animation duration
          iconSize: 27,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          gap: 8, // tab button hover color
          // onTabChange: (){print(Pageindex);},

          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.restaurant_menu,
              text: 'Menu',
            ),
            GButton(
              icon: Icons.edit_note,
              text: 'Register',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
              widget.manageSelectedIndex(index);
            });
          },
        ),
      ),
    );
  }
}
