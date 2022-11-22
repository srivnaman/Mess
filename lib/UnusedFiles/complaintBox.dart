import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/UnusedFiles/complaint_model.dart';

class ComplaintBox extends StatelessWidget {
  final List<ComplaintModel> complaints;
  const ComplaintBox(this.complaints);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: complaints.isEmpty
          ? Column(
              children: [
                SizedBox(height: 30.h),
                Text(
                  'Awesome!!! \n There are no complaints.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
              ],
            )
          : Container(
              child: ListView.builder(
                itemCount: complaints.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 7,
                    child: ListTile(
                      leading: Icon(Icons.food_bank_rounded),
                      title: Text(
                          complaints[index].msgOfComplaint.substring(0, 10)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
