import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/models/complaint_model.dart';
import 'package:mess/widgets/complaintBox.dart';
import 'package:mess/widgets/complaintChart.dart';

class ComplaintM extends StatefulWidget {
  static const routeName = '/complaintM';
  const ComplaintM({Key? key}) : super(key: key);

  @override
  State<ComplaintM> createState() => _ComplaintState();
}

class _ComplaintState extends State<ComplaintM> {
  List complaintCharts = [
    {'title': 'Food Quality Complaints', 'number': 1},
    {'title': 'Food Serving Complaints', 'number': 2},
    {'title': 'Mess Cleanliness Complaints', 'number': 3},
    {'title': 'Other Issues Complaints', 'number': 5}
  ];

  List<ComplaintModel> _userComplaints = [
    ComplaintModel(
        idOfComplaint: "1",
        typeOfComplaint: 'Food Quality',
        msgOfComplaint: 'Test 1 Success has been Checked'),
    ComplaintModel(
        idOfComplaint: "2",
        typeOfComplaint: 'Food Serving',
        msgOfComplaint: 'Test 2 Success has been Checked')
  ];

  void getUserData() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserData();
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
                    height: 70.h,
                  ),
                  Row(
                    children: complaintCharts
                        .map((cmp) =>
                            ComplaintChart(cmp['title'], cmp['number']))
                        .toList(),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            "Complaint History",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  ComplaintBox(_userComplaints),

                  /*decoration: InputDecoration(
                        
                        border: OutlineInputBorder(borderRadius: BorderRadius(20)),
                        hintText: 'Enter a full query',
                      ),*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
