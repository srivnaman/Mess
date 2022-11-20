// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/widgets/DropDown.dart';

class Complaint extends StatefulWidget {
  static const routeName = '/complaint';

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  final complaintController = TextEditingController();
  bool _isProcessing = false;

  List<Map<String, String>> myComplaints = [];

  void getUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final currentUserData =
        await FirebaseFirestore.instance.doc('users/' + uid!).get();

    myComplaints = currentUserData['complaints'];

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  final curUser = FirebaseAuth.instance.currentUser;

  void _submitToDB() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(curUser!.uid)
        .update(
      {
        'complaints': myComplaints,
      },
    );
  }

  final List<String> complaint = [
    'Food quality issue',
    'Food serving issue',
    'Cleanliness issue',
    'Other'
  ];

  String complaintType = "Other";
  void handleComplaint(value) {
    complaintType = value;
  }

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
                    height: 40.h,
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
                    handleDropDown: handleComplaint,
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
                      controller: complaintController,
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
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3F5C94),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        _isProcessing = true;
                      });
                      myComplaints.add({
                        'Id': curUser!.uid + myComplaints.length.toString(),
                        'Complaint': complaintController.text,
                        'Type': complaintType
                      });
                      _submitToDB();
                      complaintController.clear();

                      setState(() {
                        _isProcessing = false;
                      });
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
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