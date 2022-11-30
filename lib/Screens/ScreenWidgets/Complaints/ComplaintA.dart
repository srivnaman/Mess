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

        return Card(
          elevation: 7,
          child: ListTile(
            leading: Icon(Icons.food_bank_rounded,
                color: doc['status'] ? Colors.green[600] : Colors.red[600]),
            title: Text(
              doc['complaint'],
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.verified,
                color: doc['verified'] == true ? Colors.green : Colors.blueGrey,
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
        );
      },
    );
  }

  Widget rowItem(context, index, snapshot) {
    return Dismissible(
        key: Key(snapshot[index]),
        onDismissed: (direction) {},
        background: deleteBgItem(),
        child: Card(
          child: ListTile(
            title: Text(snapshot[index]),
          ),
        ));
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
