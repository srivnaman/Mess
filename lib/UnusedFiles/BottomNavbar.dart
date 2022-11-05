import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
  // final Function screenvalue;
  BottomNavBar();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Colors.white,
        strokeColor: Color.fromARGB(255, 40, 40, 40),
        unSelectedColor: Colors.white54,
        backgroundColor: Colors.black,
        borderRadius: const Radius.circular(20.0),
        items: [
          CustomNavigationBarItem(
            icon: const Icon(
              (Icons.home),
              
            ),
            
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              Icons.restaurant_menu,
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(
              Icons.edit_note,
            ),
          ),
          
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // widget.screenvalue(_currentIndex);
          });
        },
      ),
    );
  }
}
