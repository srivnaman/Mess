import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/UnusedFiles/complaint_model.dart';
import 'package:mess/UnusedFiles/complaintBox.dart';
import 'package:mess/Screens/ScreenWidgets/Complaints/Widgets/complaintChart.dart';
import '../../../UnusedFiles/User.dart';

class ComplaintM extends StatefulWidget {
  static const routeName = '/complaintM';

  @override
  State<ComplaintM> createState() => _ComplaintState();
}

class _ComplaintState extends State<ComplaintM> {
  int numFoodQuality = 0;
  int numFoodServing = 0;
  int numMessCleanliness = 0;
  int numOthers = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('complaints').snapshots(),
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  ComplaintChart(
                      numFoodQuality: numFoodQuality,
                      numFoodServing: numFoodServing,
                      numMessCleanliness: numMessCleanliness,
                      numOthers: numOthers),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Complaint History",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  snapshot.hasData
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot doc = snapshot.data!.docs[index];
                              if (doc['type'] == 'Food quality issue') {
                                numFoodQuality += 1;
                              } else if (doc['type'] == 'Food serving issue') {
                                numFoodServing += 1;
                              } else if (doc['type'] == 'Cleanliness issue') {
                                numMessCleanliness += 1;
                              } else {
                                numOthers += 1;
                              }
                              return Card(
                                elevation: 7,
                                child: ListTile(
                                  leading: Icon(Icons.food_bank_rounded),
                                  title: Text(
                                    doc['complaint'],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {},
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Column(
                          children: [
                            SizedBox(height: 30.h),
                            Text(
                              'Awesome!!! \n There are no complaints.',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.h),
                          ],
                        )
                ],
              ),
            ),
          );
        });
  }
}
