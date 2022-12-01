import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/Screens/ScreenWidgets/Complaints/Widgets/complaintChart.dart';

class ComplaintA extends StatefulWidget {
  static const routeName = '/complaintA';

  @override
  State<ComplaintA> createState() => _ComplaintState();
}

class _ComplaintState extends State<ComplaintA> {
  bool isLoading = false;
  Widget showList(snapshot) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        DocumentSnapshot doc = snapshot.data!.docs[index];

        return Dismissible(
          key: Key(snapshot[index]),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              FirebaseFirestore.instance
                  .collection("complaints")
                  .doc(snapshot.data!.docs[index]['id'])
                  .delete();
            } else if (direction == DismissDirection.startToEnd) {
              FirebaseFirestore.instance
                  .collection("complaints")
                  .doc(snapshot.data!.docs[index]['id'])
                  .update({'verified': true});
            }
          },
          background: deleteBgItem(),
          child: Card(
            elevation: 7,
            child: ListTile(
              leading: Icon(Icons.food_bank_rounded,
                  color: doc['status'] ? Colors.green[600] : Colors.red[600]),
              title: TextButton(
                  child: Text(
                    doc['complaint'],
                    overflow: TextOverflow.ellipsis,
                  ),
                  onPressed: () {
                    String fullComplaint = doc['complaint'];
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            icon: Icon(
                              Icons.report_problem,
                            ),
                            elevation: 10,
//                                 titlePadding: 40,
//                                 contentPadding: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0))),
                            title: Text("Complaint"),
                            content: Text(
                              fullComplaint,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 1, 56, 112),
//                                       fontSize: 1,

                                  fontFamily: 'Nunito'),
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF3F5C94),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(color: Color(0xFFFFFFFF)),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }),
              trailing: IconButton(
                icon: Icon(
                  Icons.verified,
                  color:
                      doc['verified'] == true ? Colors.green : Colors.blueGrey,
                ),
                onPressed: () {
                  String id = doc.id;
                  FirebaseFirestore.instance
                      .collection("complaints")
                      .doc(id)
                      .update({'verified': !doc['verified']});
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget deleteBgItem() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
      color: Colors.red[600],
      child: Icon(Icons.delete),
    );
  }

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
                          ? Expanded(child: showList(snapshot))
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
