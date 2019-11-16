import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Day.dart';
import 'CardData.dart';

class MessCard extends StatefulWidget {
  static const String id = "Mess_Card";
  final CardData data;
  MessCard({@required this.data});

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<MessCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 31,
        itemBuilder: (BuildContext context, int index) => Day(
          day: index + 1,
          meals: widget.data.data[index],
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
//        mainAxisSpacing: 1.0,
//        crossAxisSpacing: 1.0,
      ),
    );
  }
}
