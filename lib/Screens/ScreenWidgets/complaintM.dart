import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/models/complaint_model.dart';
import 'package:mess/widgets/complaintBox.dart';
import 'package:mess/widgets/complaintChart.dart';
import '../../models/User.dart';

class ComplaintM extends StatefulWidget {
  static const routeName = '/complaintM';
  const ComplaintM({Key? key}) : super(key: key);

  @override
  State<ComplaintM> createState() => _ComplaintState();
}

int numFoodQuality = 0;
int numFoodServing = 0;
int numMessCleanliness = 0;
int numOthers = 0;

class _ComplaintState extends State<ComplaintM> {
  List complaintCharts = [
    {'title': 'Food Quality Complaints', 'number': numFoodQuality},
    {'title': 'Food Serving Complaints', 'number': numFoodServing},
    {'title': 'Mess Cleanliness Complaints', 'number': numMessCleanliness},
    {'title': 'Other Issues Complaints', 'number': numOthers}
  ];

  List<ComplaintModel> _userComplaints = [];

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
    Stream<List<ComplaintModel>> readComplaints() => FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => UserModel.fromJson(doc.data()))
            .toList());
    return StreamBuilder<List<ComplaintModel>>(
        stream: readComplaints(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (ComplaintModel i in snapshot.data!) {
              if (i.typeOfComplaint == 'Food quality issue')
                numFoodQuality++;
              else if (i.typeOfComplaint == 'Food serving issue')
                numFoodServing++;
              else if (i.typeOfComplaint == 'Cleanliness issue')
                numMessCleanliness++;
              else if (i.typeOfComplaint == 'Other') numOthers++;
              _userComplaints.add(i);
            }
          }
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
        });
  }
}
