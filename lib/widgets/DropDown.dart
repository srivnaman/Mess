// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDown extends StatefulWidget {
  Function handleDropDown;
  var text;
  final List<String> items;
  Color dropDownColor;

  DropDown(
      {required this.items,
      required this.handleDropDown,
      required this.text,
      this.dropDownColor = Colors.white});
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: widget.dropDownColor),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          value: selectedValue,
          isExpanded: true,
          hint: Text(widget.text, style: TextStyle(fontSize: 15.sp)),
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
                selectedValue = val.toString();
                widget.handleDropDown(selectedValue);
              },
            );
          },
        ),
      ),
    );
  }
}
