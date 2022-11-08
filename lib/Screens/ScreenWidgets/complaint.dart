// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/widgets/DropDown.dart';

class Complaint extends StatefulWidget {
  static const routeName = '/complaint';
  const Complaint({Key? key}) : super(key: key);

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  String? categoryValue;

  final List<String> complaint = [
    'Food quality issue',
    'Food serving issue',
    'Cleanliness issue',
    'Other'
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Divider(color: Color.fromARGB(255, 255, 255, 255)),
            Container(
              width: 280.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Complaint",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DropDown(
                    items: complaint,
                    categoryValue: categoryValue,
                    text: "Select Complaint",
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Write a detailed explanation",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    //height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.white),
                    //color: Colors.white,
                    child: TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        hintText: 'Enter a full query',
    
                        /*decoration: InputDecoration(
                        
                        border: OutlineInputBorder(borderRadius: BorderRadius(20)),
                        hintText: 'Enter a full query',
                      ),*/
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


/*
Container(
      child: Column(
        children: [
          Divider(color: Color.fromARGB(255, 255, 255, 255)),
          Container(
            width: 250.w,
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
*/