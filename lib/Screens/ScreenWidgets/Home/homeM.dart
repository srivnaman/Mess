import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mess/Screens/ScreenWidgets/Home/home.dart';
import 'package:mess/widgets/DropDown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class OrderDetails {
  String meal;
  String day;
  var date;
  int qty;
  OrderDetails(this.meal, this.day, this.date, this.qty);
}
class HomeM extends StatefulWidget {
  const HomeM({Key? key}) : super(key: key);

  @override
  State<HomeM> createState() => _HomeMState();
}

class _HomeMState extends State<HomeM> {
  //List <OrderDetails> ORDERS = [];
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //     stream:  FirebaseFirestore.instance.collection('orders').snapshots(),
    //
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         // DocumentSnapshot doc = snapshot.data!.docs[0];
    //         // numOthers = doc['Other'];
    //         // numMessCleanliness = doc['Cleanliness issue'];
    //         // numFoodQuality = doc['Food quality issue'];
    //         // numFoodServing = doc['Food serving issue'];
    //       }

    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Today\'s orders',
              style: TextStyle(fontSize: 30, color: Colors.white70),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 50,
              width: 280,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  //backgroundColor: Color(0xFF3F5C94),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Padding(padding: EdgeInsets.all((8)), child:Text("Breakfast",style: TextStyle(fontSize: 25),),),
                onPressed: () async {
                  DateTime now = DateTime.now();
                  DateTime todayDate = DateTime(now.year, now.month, now.day);
                  List<OrderDetails> Breakfast = [];

                  var orderRef = await FirebaseFirestore.instance.collection('orders');
                  var orderQuery = await orderRef
                      .where('meal',isEqualTo: "Breakfast" )
                      .where('date',isEqualTo: todayDate)
                      .get()
                      .then(
                          (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
                        OrderDetails oD = new OrderDetails(
                            doc["meal"], doc["day"], doc["date"], doc["qty"]);
                        Breakfast.add(oD);
                        print(doc["meal"]);
                        }
                      )
                  );

                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            //elevation: 10,
//                                 titlePadding: 40,
//                                 contentPadding: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.0))),
                            title: Center(child: Text("Today's orders " )),
//
                            content: Container(
                              height: 100.h,
                              width: 90.w,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Divider(
                                      thickness: 1.0.h,
                                      color: Colors.blueGrey,
                                    ),

                                    Text(
                                  DateFormat('yyyy-MM-dd')
                                      .format(Breakfast[0]
                                      .date.toDate()
                                  )
                                ),



                                  ],
                                ),

                               ),
                              ),
                            ),
                        );
                      }
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
//);
}
