// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  var selectedValue;
  var categoryValue;
  final List<String> items;

  DropDown({
    required this.items,
    required this.categoryValue,
  });
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 255, 255, 255)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: Color.fromARGB(255, 255, 255, 255),
          isExpanded: true,
          hint: Text('Select Day', style: TextStyle(fontSize: 15)),
          value: widget.categoryValue,
          items: widget.items.map(
            (String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ).toList(),
          onChanged: (val) {
            setState(
              () {
                widget.categoryValue = val.toString();
              },
            );
          },
        ),
      ),
    );
  }
}
