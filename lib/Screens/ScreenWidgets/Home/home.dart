// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mess/Auth/widgets/errorMessage.dart';
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

class Home extends StatefulWidget {
  static const routeName = '/home';
  var day = DateTime.now();

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<OrderDetails> ORDERS = [];

  final List<String> mealList = [
    'Breakfast',
    'Lunch',
    'Evening Snacks',
    'Dinner',
  ];
  final List<String> qtyList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  bool isSubmitting = false;
  String selectedMeal = "";
  String selectedQty = "0";

  void handleMeal(value) {
    selectedMeal = value;
  }

  void handleQty(value) {
    selectedQty = value;
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
          'qty': int.parse(selectedQty),
          'uid': curUser!.uid,
          'date': date,
        },
      );
    });
  }

  var itemsData;
  Future<void> getMyOrder() async {
    ORDERS = [];
    String myOrders =
        "Sorry! We are experiencing some Technical Difficulties...PLEASE mail us AT 20bds064@iiitdwd.ac.in";

    var orderRef = await FirebaseFirestore.instance.collection('orders');
    var orderQuery = await orderRef
        .where('uid', isEqualTo: curUser!.uid)
        .get()
        .then(
            (QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
                  OrderDetails oD = new OrderDetails(
                      doc["meal"], doc["day"], doc["date"], doc["qty"]);
                  ORDERS.add(oD);
                }));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyOrder();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('orders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {}

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
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
                          SingleChildScrollView(
                            child: Container(
                              height: 100.h,
                              child: ListView.builder(
                                itemCount: ORDERS.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                              width: 80.w,
                                              child: Text(ORDERS[index].meal)),
                                          SizedBox(
                                              width: 50.w,
                                              child: Text(ORDERS[index]
                                                  .date
                                                  .toString())),
                                          SizedBox(
                                              width: 20.w,
                                              child: Text(ORDERS[index]
                                                  .qty
                                                  .toString())),
                                        ],
                                      ),
                                      index == ORDERS.length - 1
                                          ? Divider(color: Colors.transparent)
                                          : Divider(
                                              color: Colors.black,
                                            )
                                    ],
                                  );
                                },
                              ),
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
                  height: 30,
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
                          selectedMeal = "";
                          selectedQty = '0';
                          return Container(
                            child: AlertDialog(
                              icon: Icon(
                                Icons.restaurant_menu_outlined,
                              ),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              title: Text("Today is " +
                                  "${DateFormat('EEEE').format(widget.day)}"),
                              content: Container(
                                height: 100.h,
                                width: 500.w,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    DropDown(
                                      items: mealList,
                                      handleDropDown: handleMeal,
                                      text: "Select a Meal",
                                    ),
                                    SizedBox(
                                      width: 220.w,
                                      child: Divider(
                                        color: Colors.black,
                                      ),
                                    ),
                                    DropDown(
                                      items: qtyList,
                                      handleDropDown: handleQty,
                                      text: "Select Quantity",
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                Center(
                                  child: isSubmitting
                                      ? CircularProgressIndicator()
                                      : TextButton(
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
                                                  if (selectedMeal == "") {
                                                    errorMessage.showError(
                                                        "Please select a meal");
                                                  } else if (selectedQty ==
                                                      '0') {
                                                    errorMessage.showError(
                                                        "Quantity should be greater than 0");
                                                  } else {
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      isSubmitting = true;
                                                    });
                                                    await _submitToDB(
                                                        selectedMeal);
                                                    await getMyOrder();
                                                    setState(() {
                                                      isSubmitting = false;
                                                      errorMessage
                                                          .showError("Done");
                                                    });
                                                  }
                                                },
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ],
            ),
          );
        });
  }
}
