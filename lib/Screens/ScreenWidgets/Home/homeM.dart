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
  String name;
  OrderDetails(this.meal, this.day, this.date, this.qty,this.name);
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
              height: 45,
              width: 250,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Padding(padding: EdgeInsets.all((5)), child:Text("Breakfast",style: TextStyle(fontSize: 25),),),
                onPressed: () async {
                  DateTime now = DateTime.now();
                  DateTime todayDate = DateTime(now.year, now.month, now.day);
                  // Timestamp mytimeStamp = Timestamp.fromDate(todayDate);
                  List<OrderDetails> Breakfast = [];

                  var orderRef = await FirebaseFirestore.instance.collection('orders');
                  var orderQuery = await orderRef
                      .where('meal',isEqualTo: "Breakfast" )
                      .where('date',isEqualTo: todayDate)
                      .get()
                      .then(
                          (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {

                        OrderDetails oD = new OrderDetails(
                            doc["meal"], doc["day"], doc["date"], doc["qty"],doc['name']);
                        Breakfast.add(oD);
                        // print(doc["name"]);
                        }
                      )
                  );
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 100.h,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.0))),
                            title: Center(child: Text("Today's orders " )),

                            content: Container(
                              width: 5000.w,
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
                                Container(
                                  height: 100.h,
                                  child: ListView.builder(
                                    itemCount: Breakfast.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(Breakfast[index].name),
                                          Text(Breakfast[index].qty.toString()),
                                        ],
                                      );
                                    },
                                  ),
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

            SizedBox(height: 15.h,),


// Lunch Bro
            Container(
              height: 45,
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Padding(padding: EdgeInsets.all((5)), child:Text("Lunch",style: TextStyle(fontSize: 25),),),
                onPressed: () async {
                  DateTime now = DateTime.now();
                  DateTime todayDate = DateTime(now.year, now.month, now.day);
                  // Timestamp mytimeStamp = Timestamp.fromDate(todayDate);
                  List<OrderDetails> Breakfast = [];

                  var orderRef = await FirebaseFirestore.instance.collection('orders');
                  var orderQuery = await orderRef
                      .where('meal',isEqualTo: "Lunch" )
                      .where('date',isEqualTo: todayDate)
                      .get()
                      .then(
                          (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {

                        OrderDetails oD = new OrderDetails(
                            doc["meal"], doc["day"], doc["date"], doc["qty"],doc['name']);
                        Breakfast.add(oD);
                        // print(doc["name"]);
                      }
                      )
                  );
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 100.h,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.0))),
                            title: Center(child: Text("Today's orders " )),
//
                            content: Container(
                              width: 5000.w,
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
                                    Container(
                                      height: 100.h,
                                      child: ListView.builder(
                                        itemCount: Breakfast.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Breakfast[index].name),
                                              Text(Breakfast[index].qty.toString()),
                                            ],
                                          );
                                        },
                                      ),
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
            SizedBox(height: 15.h,),

//Snacks
            Container(
              height: 45,
              width: 250,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Padding(padding: EdgeInsets.all((5)), child:Text("Evening Snacks",style: TextStyle(fontSize: 25),),),
                onPressed: () async {
                  DateTime now = DateTime.now();
                  DateTime todayDate = DateTime(now.year, now.month, now.day);
                  // Timestamp mytimeStamp = Timestamp.fromDate(todayDate);
                  List<OrderDetails> Breakfast = [];

                  var orderRef = await FirebaseFirestore.instance.collection('orders');
                  var orderQuery = await orderRef
                      .where('meal',isEqualTo: "Evening Snacks" )
                      .where('date',isEqualTo: todayDate)
                      .get()
                      .then(
                          (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {

                        OrderDetails oD = new OrderDetails(
                            doc["meal"], doc["day"], doc["date"], doc["qty"],doc['name']);
                        Breakfast.add(oD);
                        // print(doc["name"]);
                      }
                      )
                  );
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 100.h,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.0))),
                            title: Center(child: Text("Today's orders " )),

                            content: Container(
                              width: 5000.w,
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
                                    Container(
                                      height: 100.h,
                                      child: ListView.builder(
                                        itemCount: Breakfast.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Breakfast[index].name),
                                              Text(Breakfast[index].qty.toString()),
                                            ],
                                          );
                                        },
                                      ),
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
            SizedBox(height: 15.h,),

//Dinner
            Container(
              height: 45,
              width: 250,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Padding(padding: EdgeInsets.all((5)), child:Text("Dinner",style: TextStyle(fontSize: 25),),),
                onPressed: () async {
                  DateTime now = DateTime.now();
                  DateTime todayDate = DateTime(now.year, now.month, now.day);
                  // Timestamp mytimeStamp = Timestamp.fromDate(todayDate);
                  List<OrderDetails> Breakfast = [];

                  var orderRef = await FirebaseFirestore.instance.collection('orders');
                  var orderQuery = await orderRef
                      .where('meal',isEqualTo: "Dinner" )
                      .where('date',isEqualTo: todayDate)
                      .get()
                      .then(
                          (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {

                        OrderDetails oD = new OrderDetails(
                            doc["meal"], doc["day"], doc["date"], doc["qty"],doc['name']);
                        Breakfast.add(oD);
                        // print(doc["name"]);
                      }
                      )
                  );
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 100.h,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.0))),
                            title: Center(child: Text("Today's orders " )),

                            content: Container(
                              width: 5000.w,
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
                                    Container(
                                      height: 100.h,
                                      child: ListView.builder(
                                        itemCount: Breakfast.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Breakfast[index].name),
                                              Text(Breakfast[index].qty.toString()),
                                            ],
                                          );
                                        },
                                      ),
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

            SizedBox(height: 30.h,),
            Text('Previous Orders ',style: TextStyle(fontSize: 10.h,color: Colors.amber),),
            SizedBox(height: 10.h,),
//Past Orders
            Container(
              height: 40,
              width: 245,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3F5C94),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Padding(padding: EdgeInsets.all((2)), child:Text("View Previous Orders",style: TextStyle(fontSize: 18,color: Colors.white54,fontStyle: FontStyle.italic),),),
                onPressed: () async {
                  DateTime now = DateTime.now();
                  DateTime todayDate = DateTime(now.year, now.month, now.day);
                  // Timestamp mytimeStamp = Timestamp.fromDate(todayDate);
                  List<OrderDetails> Breakfast = [];

                  var orderRef = await FirebaseFirestore.instance.collection('orders');
                  var orderQuery = await orderRef
                      // .where('meal',isEqualTo: "Dinner" )
                      // .where('date',isEqualTo: todayDate)
                      .get()
                      .then(
                          (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {

                        OrderDetails oD = new OrderDetails(
                            doc["meal"], doc["day"], doc["date"], doc["qty"],doc['name']);
                        Breakfast.add(oD);
                        // print(doc["name"]);
                      }
                      )
                  );
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 100.h,
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.0))),
                            title: Center(child: Text("All orders " )),

                            content: Container(
                              width: 5000.w,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Divider(
                                      thickness: 1.0.h,
                                      color: Colors.blueGrey,
                                    ),
                                    // Text(
                                    //     DateFormat('yyyy-MM-dd')
                                    //         .format(Breakfast[0]
                                    //         .date.toDate()
                                    //     )
                                    // ),
                                    Container(
                                      height: 100.h,
                                      child: ListView.builder(
                                        itemCount: Breakfast.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Breakfast[index].name),
                                              Text(Breakfast[index].meal),
                                              Text(Breakfast[index].qty.toString()),
                                            ],
                                          );
                                        },
                                      ),
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
