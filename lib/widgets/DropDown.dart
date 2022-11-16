// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDown extends StatefulWidget {
  var selectedValue;
  var categoryValue;
  var text;
  final List<String> items;

  DropDown({
    required this.items,
    required this.categoryValue,
    required this.text
  });
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color.fromARGB(255, 255, 255, 255)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(widget.text, style: TextStyle(fontSize: 15.sp)),
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
          dropdownMaxHeight: 140.h,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
          ),
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
