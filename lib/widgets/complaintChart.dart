import 'package:flutter/material.dart';

class ComplaintChart extends StatelessWidget {
  final String title;
  final int number;
  const ComplaintChart(this.title, this.number);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(
                  number.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              )
            ])));
  }
}
