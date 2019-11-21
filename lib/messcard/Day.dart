import 'package:flutter/material.dart';
import 'package:mess_card/messcard/MealBox.dart';

class Day extends StatefulWidget {
  Day({this.day, this.meals, this.isDark, this.isCurrentDay});
  final day;
  final meals;
  final isDark;
  final isCurrentDay;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    breakfast = widget.meals[0];
    lunch = widget.meals[1];
    tea = widget.meals[2];
    dinner = widget.meals[3];
    sweet = widget.meals[4];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            right:
                BorderSide(color: widget.isDark ? Colors.white : Colors.black),
            bottom:
                BorderSide(color: widget.isDark ? Colors.white : Colors.black)),
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
                  },
                  day: widget.day,
                  meal: 0,
                  shouldChange: widget.isCurrentDay),
              Text("L"),
              MealBox(
                  isChecked: lunch,
                  onChange: (val) {
                    setState(() {
                      lunch = !lunch;
                    });
                  },
                  day: widget.day,
                  meal: 1,
                  shouldChange: widget.isCurrentDay),
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
                  day: widget.day,
                  meal: 2,
                  shouldChange: widget.isCurrentDay),
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
                  },
                  day: widget.day,
                  meal: 3,
                  shouldChange: widget.isCurrentDay),
              Text("S"),
              MealBox(
                  isChecked: sweet,
                  onChange: (val) {
                    setState(() {
                      sweet = !sweet;
                    });
                  },
                  day: widget.day,
                  meal: 4,
                  shouldChange: widget.isCurrentDay),
            ],
          ),
        ],
      ),
    );
  }
}
