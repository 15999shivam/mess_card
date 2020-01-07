import 'package:flutter/material.dart';
import 'package:mess_card/messcard/CardData.dart';
import 'package:mess_card/messcard/Day.dart';
import 'package:mess_card/screens/settings.dart';
import 'package:mess_card/messcard/Card.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.data, this.isDark, this.toggleDark});
  final CardData data;
  final bool isDark;
  final Function toggleDark;
  static const String id = "main_screen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mess Card'),
//                centerTitle: true,

          actions: <Widget>[
            Switch(
                value: widget.isDark,
                onChanged: (val) {
                  widget.toggleDark();
                }),
            GestureDetector(
              child: Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, Settings.id);
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MessCard.id,
                    arguments:
                        CardData(data: widget.data.data, day: widget.data.day));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Image.asset(
                  'assets/logo.png',
                  width: 35,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset('assets/logo.png'),
              ),
              Expanded(
                  child: Transform.scale(
                scale: 1.8,
                child: Day(
                    day: widget.data.day,
                    isCurrentDay: true,
                    isDark: widget.isDark,
                    meals: widget.data.data[widget.data.day - 1]),
              ))
            ],
          ),
        ));
  }
}
