import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplaintChart extends StatelessWidget {
  final int numFoodQuality;
  final int numFoodServing;
  final int numMessCleanliness;
  final int numOthers;
  ComplaintChart(
      {required this.numFoodQuality,
      required this.numFoodServing,
      required this.numMessCleanliness,
      required this.numOthers});

  @override
  Widget build(BuildContext context) {
    TextStyle myStyle = TextStyle(color: Colors.white);

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
  }
}
