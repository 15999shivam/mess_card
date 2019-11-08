import 'package:flutter/material.dart';
import 'package:mess_card/MealBox.dart';

class Day extends StatefulWidget {
  Day({this.day});
  final day;
  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  bool breakfast = false;
  bool lunch = false;
  bool tea = false;
  bool dinner = false;
  bool sweet = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            right: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${widget.day}",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("B"),
              MealBox(
                  isChecked: breakfast,
                  onChange: (val) {
                    setState(() {
                      breakfast = !breakfast;
                    });
                  }),
              Text("L"),
              MealBox(
                isChecked: lunch,
                onChange: (val) {
                  setState(() {
                    lunch = !lunch;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("T"),
              MealBox(
                isChecked: tea,
                onChange: (val) {
                  setState(() {
                    tea = !tea;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("D"),
              MealBox(
                  isChecked: dinner,
                  onChange: (val) {
                    setState(() {
                      dinner = !dinner;
                    });
                  }),
              Text("S"),
              MealBox(
                  isChecked: sweet,
                  onChange: (val) {
                    setState(() {
                      sweet = !sweet;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
