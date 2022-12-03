// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess/widgets/DropDown.dart';

class MenuPage extends StatefulWidget {
  static const routeName = '/menu';
  MenuPage({Key? key}) : super(key: key);
  int index = 0;
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String? categoryValue;
  final List<String> mealList = [
    'Breakfast',
    'Lunch',
    'Evening Snacks',
    'Dinner',
  ];
  final List<String> dayList = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Everyday'
  ];
  String? selectedDay;
  String? selectedMeal;
  void handleDay(value) {
    selectedDay = value;
  }

  void handleMeal(value) {
    selectedMeal = value;
  }

  Future getMenu(String? day, String? meal) async {
    String menuRequired =
        "Sorry! We are experiencing some Technical Difficulties...PLEASE mail us AT 20bds064@iiitdwd.ac.in";
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      await FirebaseFirestore.instance
          .collection('menu')
          .where('meal', isEqualTo: meal)
          .where('day', isEqualTo: day)
          .get()
          .then((res) {
        res.docs.forEach((documentSnapshot) async {
          // print(documentSnapshot.reference);
          menuRequired = documentSnapshot.data()['food'].toString();
        });
      });
    });
    return menuRequired;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Divider(color: Color.fromARGB(255, 255, 255, 255)),
          Container(
            width: 250.w,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Select a Meal",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DropDown(
                  items: mealList,
                  handleDropDown: handleMeal,
                  text: "Select a Meal",
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Select Day",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10.h,
                ),
                DropDown(
                  items: dayList,
                  handleDropDown: handleDay,
                  text: "Select Day",
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3F5C94),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  child: Text("See Menu"),
                  onPressed: () async {
                    var menuRequired = await getMenu(selectedDay, selectedMeal);
                    if (selectedDay != null && selectedMeal != null) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: AlertDialog(
                                icon: Icon(
                                  Icons.restaurant_menu,
                                ),
                                elevation: 10,
//                                 titlePadding: 40,
//                                 contentPadding: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(32.0))),
                                title: Text("We are making.."),
                                content: Text(
                                  menuRequired.toString(),
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
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Close",
                                      style:
                                          TextStyle(color: Color(0xFFFFFFFF)),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
