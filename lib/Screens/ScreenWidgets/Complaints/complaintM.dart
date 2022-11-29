import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/Screens/ScreenWidgets/Complaints/Widgets/complaintChart.dart';

class ComplaintM extends StatefulWidget {
  static const routeName = '/complaintM';

  @override
  State<ComplaintM> createState() => _ComplaintState();
}

class _ComplaintState extends State<ComplaintM> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('complaints').snapshots(),
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
                      ComplaintChart(),
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
                                  DocumentSnapshot doc =
                                      snapshot.data!.docs[index];

                                  return Card(
                                    elevation: 7,
                                    child: ListTile(
                                      leading: Icon(Icons.food_bank_rounded,
                                          color: doc['status']
                                              ? Colors.green[600]
                                              : Colors.red[600]),
                                      title: Text(
                                        doc['complaint'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.red[600]),
                                        onPressed: () {},
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  'Awesome!!! \n There are no complaints.',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
