import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class gbottomNavBar extends StatefulWidget {
  const gbottomNavBar({ Key? key }) : super(key: key);
  
  @override
  State<gbottomNavBar> createState() => _gbottomNavBarState();
}

class _gbottomNavBarState extends State<gbottomNavBar> {
  //final int pageIndex;
  //gbottomNavBar(this.pageIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
          child: GNav(
            selectedIndex: 0,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 59, 59, 59),//Colors.blueGrey,
            haptic: true, // haptic feedback
            tabBorderRadius: 20, 
            curve: Curves.easeInOutCubic, // tab animation curves
            //duration: Duration(milliseconds: 10), // tab animation duration
            iconSize: 27, 
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            gap: 8, // tab button hover color
           // onTabChange: (){print(Pageindex);},
            
            tabs: [
              GButton(icon: Icons.home, text: 'Home',),
              GButton(icon: Icons.restaurant_menu, text:'Menu'),
              GButton(icon: Icons.edit_note,text: 'Register',),
              GButton(icon: Icons.person, text: 'Profile',),
            ],
          ),
        ),      
      );
  }
}

