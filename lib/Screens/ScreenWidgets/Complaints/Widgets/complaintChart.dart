import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplaintChart extends StatefulWidget {
  @override
  State<ComplaintChart> createState() => _ComplaintChartState();
}

class _ComplaintChartState extends State<ComplaintChart> {
  int numFoodQuality = 0;
  int numFoodServing = 0;
  int numMessCleanliness = 0;
  int numOthers = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextStyle myStyle = TextStyle(color: Colors.white);

    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance.collection('complaintsCount').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          DocumentSnapshot doc = snapshot.data!.docs[0];
          numOthers = doc['Other'];
          numMessCleanliness = doc['Cleanliness issue'];
          numFoodQuality = doc['Food quality issue'];
          numFoodServing = doc['Food serving issue'];
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 70.w,
              child: Column(
                children: [
                  Text(
                    numFoodQuality.toString(),
                    style: myStyle,
                    textScaleFactor: 1.5,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Food Quality Complaints",
                    style: myStyle,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 0.8,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 70.w,
              child: Column(
                children: [
                  Text(
                    numFoodServing.toString(),
                    style: myStyle,
                    textScaleFactor: 1.5,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Food Serving Complaints',
                    style: myStyle,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 0.8,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 70.w,
              child: Column(
                children: [
                  Text(
                    numMessCleanliness.toString(),
                    style: myStyle,
                    textScaleFactor: 1.5,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Cleanliness Complaints',
                    style: myStyle,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 0.8,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 70.w,
              child: Column(
                children: [
                  Text(
                    numOthers.toString(),
                    style: myStyle,
                    textScaleFactor: 1.5,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Other Issues Complaints',
                    style: myStyle,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 0.8,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
