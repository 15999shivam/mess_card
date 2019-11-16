import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess_card/networkig/CheckBox.dart' as network;

class MealBox extends StatelessWidget {
  MealBox({this.isChecked, this.onChange, this.day, this.meal});
  final isChecked;
  final Function onChange;
  final day;
  final meal;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onChanged: (val) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
                title: Text("Alert Dialog title"),
                content: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          final res = await network.checkBox({
                            'day': day,
                            'meal': meal,
                          });
                          if (res == 1) onChange(true);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          print("No");
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
      },
      value: isChecked,
    );
  }
}
