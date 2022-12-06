// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mess/widgets/DropDown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class OrderDetails{
  String meal;
  String day;
  var date;
  int qty;
  OrderDetails(this.meal,  this.day , this.date, this.qty);
}

class Home extends StatefulWidget {
  static const routeName = '/home';
  var day = DateTime.now();

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <OrderDetails> ORDERS = [];

  final List<String> mealList = [
    'Breakfast',
    'Lunch',
    'Evening Snacks',
    'Dinner',
  ];
  final qtyController = TextEditingController();
  bool isSubmitting = false;
  String selectedMeal="lunch";
  int? quantity=1;
  String meal = "";

  void handleMeal(value) {
    selectedMeal = value;
  }
  final curUser = FirebaseAuth.instance.currentUser;
  Future<void> _submitToDB(String meal) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      DateTime now = DateTime.now();
      DateTime date = DateTime(now.year, now.month, now.day);
      var today = DateFormat('EEEE').format(widget.day);
      await FirebaseFirestore.instance.collection('orders').add(
        {
          'meal': meal,
          'day': today,
          'qty':quantity,
          'uid': curUser!.uid,
          'date': date,

        },
      );
    });
  }

  var itemsData;
  //List <OrderDetails> ORDERS = [];
  Future<void> getMyOrder() async {
    print("#######################################################################3333");
    ORDERS = [];
    String myOrders =
        "Sorry! We are experiencing some Technical Difficulties...PLEASE mail us AT 20bds064@iiitdwd.ac.in";


  var  orderRef  =  await FirebaseFirestore.instance.collection('orders');
  var orderQuery =  await orderRef.where('uid',isEqualTo: curUser!.uid).get()
      .then((QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
        OrderDetails oD = new OrderDetails(doc["meal"], doc["day"], doc["date"], doc["qty"]);
        ORDERS.add(oD);
        print(ORDERS.length);


  }));
  setState(() {
    print("#####");
      print(ORDERS.length);
  });
  //ORDERS;
  }

  //List<OrderDetails> myor = getMyOrder();
  //getMyOrder()

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyOrder();
  }
  // where('uid',isEqualTo: curUser!.uid).get()
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance.collection('orders').snapshots(),

      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // DocumentSnapshot doc = snapshot.data!.docs[0];
          // numOthers = doc['Other'];
          // numMessCleanliness = doc['Cleanliness issue'];
          // numFoodQuality = doc['Food quality issue'];
          // numFoodServing = doc['Food serving issue'];
        }


        return Column(
          children: [
            SizedBox(
              height: 20.h,
            ),

            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'My Orders',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 56, 112),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      Divider(
                        thickness: 1.0.h,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      //getPostsData(),

                      // Container(
                      //   height: 30.h,
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey,
                      //     borderRadius: BorderRadius.circular(20.r),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Text(
                      //         "Sunday",
                      //         style: TextStyle(
                      //           color: Colors.blueAccent,
                      //           fontSize: 20.sp,
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'Nunito',
                      //         ),
                      //       ),
                      //       Text(
                      //         "${mealList[0]}",
                      //         style: TextStyle(
                      //           color: Colors.white70,
                      //           fontSize: 20.sp,
                      //           fontWeight: FontWeight.bold,
                      //           fontFamily: 'Nunito',
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 100.h,
                          // decoration: BoxDecoration(
                          //   color: Colors.grey,
                          //   borderRadius: BorderRadius.circular(20.r),
                          // ),
                          child: ListView.builder(
                            itemCount: ORDERS.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(ORDERS[index].meal),
                                  Text(ORDERS[index].qty.toString()),

                                  // Text(ORDERS[index].date),
                                ],
                              );

                            },
                          )
                          ,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),

            // Text(
            //   "${getMyOrder()}",
            //   style: TextStyle(
            //     color: Colors.white70,
            //     fontSize: 20.sp,
            //     fontWeight: FontWeight.bold,
            //     fontFamily: 'Nunito',
            //   ),
            // ),
            SizedBox(
              height: 30.h,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3F5C94),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              child: Text("Place Today's Order"),
              onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            icon: Icon(
                              Icons.restaurant_menu_outlined,
                            ),
                            elevation: 10,
//                                 titlePadding: 40,
//                                 contentPadding: 20,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.0))),
                            title: Text("Today is " +"${DateFormat('EEEE').format(widget.day)}" ),
//                         content: Text(
//                           menuRequired.toString(),
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 1, 56, 112),
// //                                       fontSize: 1,
//
//                               fontFamily: 'Nunito'),
//                           textAlign: TextAlign.center,
//                         ),
                              content: Container(
                                height: 100.h,
                                width: 90.w,
                                child: Column(
                                  children: [
                                    DropDown(
                                      items: mealList,
                                      handleDropDown: handleMeal,
                                      text: "Select a Meal",
                                    ),
                                    SizedBox(height: 10.h
                                      ,),
                                    TextField(
                                      controller: qtyController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter a quantity',
                                      ),

                                    ),
                                  ],
                                ),
                              ),



                            actions: [


                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF3F5C94),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5.r),
                                  ),
                                ),

                              onPressed: isSubmitting? null: ()
                              async {
                                setState(() {
                                   isSubmitting = true;
                                });
                                quantity = int.parse(qtyController.text);
                                meal = selectedMeal;
                                await _submitToDB(meal);
                                qtyController.clear();
                                setState(() {
                                    isSubmitting = false;
                                 });
                              },
                                child: Text(
                                  "Ok 👍",
                                  style:
                                  TextStyle(color: Color(0xFFFFFFFF)),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      );

              },
            ),

            //ElevatedButton(onPressed: onPressed, child: child)



          ],
        );
      }
    );
  }


}



//Today's order section
// Padding(
//   padding: EdgeInsets.symmetric(horizontal: 16.w),
//   child: Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(20.r),
//       color: Colors.white,
//     ),
//     child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 15.w),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 10.h,
//           ),
//           Text(
//             'Today\'s orders',
//             style: TextStyle(
//               color: Color.fromARGB(255, 1, 56, 112),
//               fontSize: 20.sp,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Nunito',
//             ),
//           ),
//           Divider(
//             thickness: 1.0.h,
//             color: Colors.blueGrey,
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 constraints:
//                     BoxConstraints(maxWidth: 50.h, maxHeight: 70.h),
//                 //height: 30.h,
//                 //width: 60.w,
//                 decoration: BoxDecoration(
//                   color: Colors.blueGrey,
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//               ),
//               Container(
//                 constraints:
//                     BoxConstraints(maxWidth: 50.h, maxHeight: 70.h),
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//               ),
//               Container(
//                 constraints:
//                     BoxConstraints(maxWidth: 50.h, maxHeight: 70.h),
//                 //  height: 30.h,
//                 //  width: 60.w,
//                 decoration: BoxDecoration(
//                   color: Colors.blueGrey,
//                   borderRadius: BorderRadius.circular(20.r),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//         ],
//       ),
//     ),
//   ),
// ),