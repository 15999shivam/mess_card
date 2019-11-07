import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Entry();
  }
}

class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: isDark ? Brightness.dark : Brightness.light,
          toggleableActiveColor: isDark ? Colors.red : Colors.blue),
//      darkTheme: ThemeData(
//          brightness: Brightness.dark,
//          accentColor: Colors.red,
//          toggleableActiveColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mess Card'),
          centerTitle: true,
          actions: <Widget>[
            Switch(
                value: isDark,
                onChanged: (val) {
                  setState(() {
                    isDark = !isDark;
                  });
                }),
          ],
        ),
        body: Card(),
      ),
    );
  }
}

class Card extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 31,
        itemBuilder: (BuildContext context, int index) => Day(
          day: index + 1,
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
//        mainAxisSpacing: 1.0,
//        crossAxisSpacing: 1.0,
      ),
    );
  }
}

class Day extends StatefulWidget {
  Day({this.day});
  final day;
  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  bool breakfast = false;
  bool lunch = false;
  bool snacks = false;
  bool dinner = false;

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
                  isChecked: snacks,
                  onChange: (val) {
                    setState(() {
                      snacks = !snacks;
                    });
                  }),
              Text("D"),
              MealBox(
                  isChecked: dinner,
                  onChange: (val) {
                    setState(() {
                      dinner = !dinner;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class MealBox extends StatelessWidget {
  MealBox({this.isChecked, this.onChange});
  final isChecked;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: onChange,
      value: isChecked,
    );
  }
}

//FlatButton(
//child: Container(
//child: Text("$day"),
//decoration:
//BoxDecoration(border: Border.all(color: Colors.black)),
//),
//onPressed: () => {debugPrint("$day")},
//),
