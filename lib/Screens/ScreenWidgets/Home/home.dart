// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mess/widgets/DropDown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  var day = DateTime.now();

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      // var orderCountDocumentRef = await FirebaseFirestore.instance
      //     .collection('ordersCount')
      //     .doc('TODO LATER');
      // var orderCountDocument = await transaction.get(orderCountDocumentRef);
      // await transaction
      //     .update(orderCountDocumentRef, {type: orderCountDocument[meal] + qty});
    });
  }
  @override
  Widget build(BuildContext context) {
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
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.r),
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

                          onPressed: isSubmitting
                          ? null
                              : () async {
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
        )


      ],
    );
  }
}

class myOrder extends StatefulWidget {
  const myOrder({Key? key}) : super(key: key);

  @override
  State<myOrder> createState() => _myOrderState();
}

class _myOrderState extends State<myOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('hjhj'),);
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